package com.jns.product.websocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

public class ProductApplicantWebSocketHandler {

	//WebSocketSession : 클라이언트와 서버간의 전이중 통신 담당 객체
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
	//관심상품의 최저가 가격이 변경되면 해당 클라이언트에게 통지하는 메소드
	public void noticeLpriceApplicant() {
		
	}
}
