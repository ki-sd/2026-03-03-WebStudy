package com.sist.manager;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.HandshakeResponse;
import jakarta.websocket.server.HandshakeRequest;
import jakarta.websocket.server.ServerEndpointConfig;
import jakarta.websocket.server.ServerEndpointConfig.Configurator;

// WebSocket에서 HttpSession을 사용할 수 있게 설정
public class WebSocketSessionConfigurator extends Configurator{
/*
 *    1. 사용자 로그인 => id,name 저장 => HttpSession
 *           |
 *        WebSocket에 접속 (ws://..../chat)
 *           |
 *    2.  modifyHandshake() 실행 => HttpSession 저장
 *           |
 *        request.getHttpSession() => 가지고오기
 *           |
 *        ServerEndpointConfig의 UserProperties에 저장
 *    3.  OnOpen() 연결시 실행
 *           | HttpSession을 가지고 온다
 *    4.  OnMessage() => 채팅 시작
 *           
 *    HttpSession ==== WebSocket에 연결하는 역할
 */
	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		// HTTP요청 => HttpSession 읽기
		HttpSession session=(HttpSession)request.getHttpSession();
		if(session!=null) {
			// WebSocket 에서 사용 가능 저장 => UserProperties
			sec.getUserProperties().put(HttpSession.class.getName(), session);
			
		}
	}
	
}
