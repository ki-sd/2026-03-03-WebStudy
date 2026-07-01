package com.sist.manager;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.HandshakeResponse;
import jakarta.websocket.server.HandshakeRequest;
import jakarta.websocket.server.ServerEndpointConfig;
import jakarta.websocket.server.ServerEndpointConfig.Configurator;
// WebSocket 연결시 HttpSession을 WebSocket으로 전달하기 위한 클래스
public class WebSocketSessionConfigurator extends Configurator{
    // WebSocket연결 직전에 자동으로 호출되는 메서드
	/*
	 *   Handshake
	 *     HTTP ===> WS변경
	 */
	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		// HTTP 요청에서 HttpSessionㅇ을 가져온다
		HttpSession session=(HttpSession)request.getHttpSession();
		// 로그인 된 경우
		if(session!=null) {
			// WebSocket을 UserProperties에 저장
			// OnClose() OnOpen() OnMessage() => HttpSession 사용 가능하게
			sec.getUserProperties().put(HttpSession.class.getName(), session);
			// properties에 세션 저장
		}
		// 접속자마다 구분 => 0 .....
		/*
		 *    WebSocket에서는 HttpSession을 직접 사용 불가
		 *    => UserProperties에 저장 후 접근 가능하게 설정
		 *    
		 *    HTTP => WebSocket으로 연결되는 순간 실행되는 클래스
		 *      |        |
		 *     ----------- HandShake (유선 => 무선)
		 *     
		 *     브라우저
		 *       | HTTP요청
		 *     HttpSession 생성
		 *       | WebSocket 연결 요청
		 *     modifyHandshake
		 *       | request.getSession()
		 *       | UserProperties에 저장
		 *     @OnOpen
		 *       | UserProperties에 저장된 HttpSession
		 */
	}

}
