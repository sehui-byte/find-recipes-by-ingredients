package com.jns.product.websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ProductApplicantWebSocketHandler extends TextWebSocketHandler {

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
		return mid == null?null:mid;
	}
	
	//관심상품의 최저가 가격이 변경되면 해당 클라이언트에게 통지하는 메소드
	public void noticeLpriceApplicant(WebSocketSession session) {
		TextMessage message = new TextMessage("관심상품 최저가가 변동되었습니다!");
		try {
			//로그인한 유저에게 메세지 전달
			users.get(getMid(session)).sendMessage(message);
		} catch (IOException e) {
			System.out.println("전송중 에러 발생 >> " + e.getMessage());
		}
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
}
