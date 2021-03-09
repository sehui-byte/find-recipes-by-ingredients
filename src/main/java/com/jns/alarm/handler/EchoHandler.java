package com.jns.alarm.handler;

import java.io.IOException;
import java.io.StringReader;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.commons.logging.impl.Log4JLogger;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.jns.alarm.dao.AlarmDAO;
import com.jns.alarm.dao.AlarmDAOImpl;
import com.jns.alarm.vo.AlarmVO;
import com.jns.chabun.dao.ChabunDAO;
import com.jns.chabun.dao.ChabunDAOImpl;
import com.jns.chef.controller.ChefController;
import com.jns.common.ChabunUtil;
import com.jns.member.dao.MemberDAO;
import com.jns.member.dao.MemberDAOImpl;
import com.jns.member.vo.MemberVO;
import com.jns.product.dao.ProductDAO;
import com.jns.product.service.ProductService;
import com.jns.product.vo.ProductVO;

public class EchoHandler extends TextWebSocketHandler {
	Logger logger = Logger.getLogger(EchoHandler.class);
	private AlarmDAO adao;
	private ChabunDAO chabun;
	
	@Autowired(required=false)
	public EchoHandler(AlarmDAO adao, ChabunDAO chabun) {
		this.adao = adao;
		this.chabun = chabun;
	}

	//로그인중인 개별유저
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	Integer count = 0; //쌓인 알람수

	//클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		String userMno = getMno(session);//세션으로 유저 mno 얻어옴
		if(userMno != null) {
			logger.info(userMno + "서버 연결됨.");
			users.put(userMno,session); //로그인중인 개별 유저 저장
			WebSocketSession user = users.get(userMno);
			
			AlarmVO avo = new AlarmVO();
			avo.setReceiver(userMno);
			if(adao.countAlarm(avo) == null) {
				logger.info("쌓인 알람 없음!");
				count = 0; 
			}
			else {//쌓인 알람이 존재할 경우
				count = Integer.valueOf(adao.countAlarm(avo));
				logger.info("쌓인 알람수 >> " + count);
				user.sendMessage(new TextMessage("null,"+userMno +",count"+count));//쌓인 알림 개수 보내줌
				
			}
		}
	}

	//세션을 통해 로그인한 유저의 mno 얻는 함수
	private String getMno(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String mno = (String) httpSession.get("mno");
		logger.info("로그인한 유저 mno >> " + mno);
		return mno == null?null:mno;
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		//클라이언트와 연결이 해제되면 제거한다
		logger.info("유저 세션 제거");
		String mno = getMno(session);
		if(mno != null) {
			users.remove(mno);
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception{
		//메세지 전송 중 에러가 발생하면 실행되는 함수
		logger.info("에러발생! 유저 세션 제거");
		String mno = getMno(session);
		if(mno != null) {
			users.remove(mno);
		}
	}

	//클라이언트가 웹소켓 서버로 메세지를 전송했을 때 실행되는 메소드
	//프로토콜 : 보낸사람mno , 받는사람mno , 유형(댓글,구독,개수count)
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message)throws Exception{
		String msg = message.getPayload();
		String[]strs = msg.split(",");
		String sender = strs[0];
		String receiver = strs[1];
		String type = strs[2];

		logger.info("msg >> " + msg);
		logger.info("sender >> " + sender);
		logger.info("receiver >> " + receiver);
		logger.info("type >> " + type);
		
		MemberVO mvo = new MemberVO();
		mvo.setMid(receiver);
		AlarmVO avo = new AlarmVO();
		System.out.println(chabun.getAlarmChabun().getAno());
		avo.setAno(ChabunUtil.getAlarmChabun("D", chabun.getAlarmChabun().getAno()));
		logger.info("생성된 알람 채번 >> " + avo.getAno());
		avo.setReceiver(receiver);
		avo.setSender(sender);
		avo.setType(type);
		
		

		boolean isLogin = false;
		for(String tmpKey : users.keySet()) {
			System.out.println("tmpKey >>" + tmpKey);
			WebSocketSession user = users.get(tmpKey);
			//로그인 상태인 경우
			if(tmpKey.equals(receiver)) {
				System.out.println("로그인 상태");
				avo.setReadyn("Y");//로그인 상태시엔 읽은 걸로 처리
				adao.insertAlarm(avo);
				avo = (AlarmVO) adao.selectOneAlarm(avo);
				String mnick = avo.getMnick();
				
				if(type.equals("subscribe")) {
					user.sendMessage(new TextMessage(",," +mnick +"님이 회원님을 구독하기 시작했습니다."));
				}
				else if(type.equals("reply")) {
					user.sendMessage(new TextMessage(",," +mnick +"님이 회원님 게시물에 댓글을 달았습니다."));
				}
				else if(type.equals("recommend")) {
					user.sendMessage(new TextMessage(",," +mnick +"님이 회원님 게시물을 추천하였습니다."));
				}
				else if(type.equals("norecommend")) {
					user.sendMessage(new TextMessage(",," +mnick +"님이 회원님 게시물에 대한 추천을 취소했습니다"));
				}
				else if(type.equals("count")) {
					user.sendMessage(new TextMessage(Integer.toString(count)));
				}
				isLogin = true;
			}
		}

		//로그아웃 상태인 경우
		if(!isLogin) {
			//DB에 저장한다
			avo.setReadyn("N");
			int nCnt = adao.insertAlarm(avo);
			logger.info("insert nCnt >> " + nCnt);
			logger.info("로그아웃 상태! db에 알람 저장!");
		}
	}
}
