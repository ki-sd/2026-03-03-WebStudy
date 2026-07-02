<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../chat/chat.css"></link>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<%--
	sockjs => websocket => stomp: 알림 / 1:1 / 그룹 채팅
 --%>
 <%--
 	실시간 뉴스 / 실시간 날씨
 	------------------- 시간 조절 => Timer : Spring 스케쥴러
  --%>
<script type="text/javascript">
/*
 * 		1. 실행과정
 		   window.onload=function(){}
 		   => $(function(){}) => Jquery
 		      $(document).ready(function(){})
 		   => 
 		   
 		----------------------------------------
 		websocket 서버연결
 		   onopen
 		   onmessage
 		   onclose
 		   ------------- 등록 : 호출할 함수 지정 => 자동호출 => CallBack
 		   => 이벤트 등록
 		1) 서버연결
 		websocket=new WebSocket("ws://localhost/JSPVueProject_3/chat")
 		                              -------------------------
 		                              | 프로젝트와 일치
 		                              | /chat => ServerEndPoint와 일치
 	    2) 서버에서 호출
 	       => @OnOpen
 	          => 밑에 있는 호출
 	    3) 메세지 전송
 	       사용자 입력
 	          |
 	       <input type=text id="messageInput">
 	          |
 	         send() => websocket.send(msg)
 	         ------
 	           입력값 읽기
 	           공백검사
 	           서버 전송
 	           입력값 초기화
 	    4) 서버에서 메세지 수신
 	       ss.getBasicRemote().sendText("msg:~~~"님 입장하셨습니다)
 	                                     --- 구분자
 	                                     my:
 	                                     you:
 	    
 	       websocket.onmessage=onMessage
 	       function onMessage(event){
 	    	  let data=event.data // 전송된 데이터
 	    	  
 	    	  if(data.substrong(0,4)==="msg:"){
 	    		  appendMessage(data.substring(4))
 	    	  }
 	       }
 */
let websocket
window.onload=(e)=>{
	connection()
}
const connection=()=>{
	websocket=new WebSocket("ws://192.168.56.104/JSPVueProject_3/chat")
	websocket.onopen=onOpen
	websocket.onclose=onClose
	websocket.onmessage=onMessage
}
const onOpen=(event)=>{
	 alert("채팅서버에 연결되었습니다")
}
const onClose=(event)=>{
	alert("채팅서버와 연결 해제되었습니다")
}
const onMessage=(event)=>{
	let data=event.data
	if(data.substring(0,4)==='msg:'){
		appendMessage(data.substring(4))
	}
}
const appendMessage=(msg)=>{
	$('#chatBox').append(msg+"<br>")
	$('#chatBox').scrollTop($('#chatBox')[0].scrollHeight)
}
const send=()=>{
	let msg=$('#messageInput').val()
	if(!msg.trim()) {
		$('#messageInput').val('').focus()
		return
	}
	websocket.send(msg)
	$('#messageInput').val('').focus()
}
$((e)=>{
	$('#sendBtn').on('click',(e)=>{
		send()
	})
	$('#messageInput').on('keydown',(e)=>{
		if(e.keyCode===13){
			send()
		}
	})
})
/*
 *      채팅창 출력 => chat.do
	       |
	    connection()
	       |
	    WebSocket 연결
	       |
	    사용자 입력
	       = 버튼 클릭
	       = 엔터
	       |
	     send()
	       |
	       메세지 입력 확인
	       |
	     websocket.send(msg) => 서버로 전송
	       |
	       서버에서는 접속자 전체 메세지 전송
	       |
	     onMessage()
	       |
	     appendMessage()
	       |
	     채팅창 출력
 */
 </script>
</head>
<body>
	<div class="chat-container">
		<div class="chat-header">실시간 채팅</div>
		<div id="chatBox" class="chat-box"></div>
		<div class="chat-input">
			<input type="text" id="messageInput" placeholder="메세지 입력..">
			<button id="sendBtn">전송</button>
		</div>
	</div>
</body>
</html>