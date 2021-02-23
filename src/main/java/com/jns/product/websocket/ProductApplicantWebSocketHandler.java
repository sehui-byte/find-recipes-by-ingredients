package com.jns.product.websocket;

import java.io.IOException;
import java.io.StringReader;
import java.util.Collections;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.jns.chef.controller.ChefController;
import com.jns.product.service.ProductService;
import com.jns.product.vo.ProductVO;

public class ProductApplicantWebSocketHandler extends TextWebSocketHandler {
	Logger logger = Logger.getLogger(ProductApplicantWebSocketHandler.class);
	private ProductService service;


	@Autowired(required=false)
	public ProductApplicantWebSocketHandler(ProductService service) {
		this.service = service;
	}

	//로그인중인 개별유저
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	//클라이언트가 서버로 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		String userId = getMid(session);//세션으로 유저 아이디 얻어옴

		if(userId != null) {
			System.out.println(userId + "연결됨.");
			users.put(userId,session); //로그인중인 개별 유저 저장
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
	//프로토콜 : 보낸사람id , 받는사람id , 유형(댓글,구독)
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message)throws Exception{
		String msg = message.getPayload();
		//System.out.println("msg >> " + msg);
		String[]strs = msg.split(",");
		String sender = strs[0];
		//System.out.println("sender >> " + sender);
		String receiver = strs[1];
		//System.out.println("receiver >> " + receiver);
		String type = strs[2];
		//System.out.println("type >> " + type);

		for(String tmpKey : users.keySet()) {
			System.out.println("tmpKey >>" + tmpKey);
			WebSocketSession user = users.get(tmpKey);
			if(tmpKey.equals(receiver)) {
				if(type.equals("subscribe")) {
					user.sendMessage(new TextMessage(sender +"님이 회원님을 구독하기 시작했습니다."));
				}
				else if(type.equals("reply")) {
					user.sendMessage(new TextMessage(sender +"님이 회원님 게시물에 댓글을 달았습니다."));
				}
			}
		}
	}
}
