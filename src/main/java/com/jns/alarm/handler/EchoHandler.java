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
//	private MemberDAO mdao = new MemberDAOImpl();
//	private AlarmDAO adao = new AlarmDAOImpl();
//	private ChabunDAO chabun = new ChabunDAOImpl();
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
		String userId = getMid(session);//세션으로 유저 아이디 얻어옴
		if(userId != null) {
			AlarmVO avo = new AlarmVO();
			avo.setReceiver(userId);
			if(adao.countAlarm(avo) == null)
				count = 0; //쌓인 알람 수
			else {
				count = Integer.valueOf(adao.countAlarm(avo));
			}
			System.out.println("쌓인 알람수 >> " + count);
			System.out.println(userId + "연결됨.");
			users.put(userId,session); //로그인중인 개별 유저 저장
			WebSocketSession user = users.get(userId);
			user.sendMessage(new TextMessage("null,"+userId +",count"+count));
		}
	}

	//세션을 통해 로그인한 유저의 id 얻는 함수
	private String getMid(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String mid = (String) httpSession.get("mid");
		System.out.println("mid >> " + mid);
		return mid == null?null:mid;
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		//클라이언트와 연결이 해제되면 제거한다
		users.remove(session);
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception{
		//메세지 전송 중 에러가 발생하면 실행되는 함수
		users.remove(session);
	}

	//클라이언트가 웹소켓 서버로 메세지를 전송했을 때 실행되는 메소드
	//프로토콜 : 보낸사람id , 받는사람id , 유형(댓글,구독,개수count)
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message)throws Exception{
		String msg = message.getPayload();
		System.out.println(msg);
		String[]strs = msg.split(",");
		String sender = strs[0];
		String receiver = strs[1];
		String type = strs[2];

		System.out.println("msg >> " + msg);
		System.out.println("sender >> " + sender);
		System.out.println("receiver >> " + receiver);
		System.out.println("type >> " + type);
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
			//System.out.println("tmpKey >>" + tmpKey);
			WebSocketSession user = users.get(tmpKey);
			//로그인 상태인 경우
			if(tmpKey.equals(receiver)) {
				System.out.println("로그인 상태");
				if(type.equals("subscribe")) {
					user.sendMessage(new TextMessage(sender +"님이 회원님을 구독하기 시작했습니다."));
				}
				else if(type.equals("reply")) {
					user.sendMessage(new TextMessage(sender +"님이 회원님 게시물에 댓글을 달았습니다."));
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
			int nCnt = adao.insertAlarm(avo);
			System.out.println("nCnt >> " + nCnt);
			System.out.println("로그아웃 상태! db에 알람 저장!");
		}
	}
}