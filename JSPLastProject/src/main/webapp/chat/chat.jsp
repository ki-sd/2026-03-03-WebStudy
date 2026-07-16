<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  .chat-container {
    margin:0px auto;
    width: 700px;
    height: 600px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    display: flex;
    flex-direction: column;
  }
  .chat-header {
    background: #4a6cf7;
    color: white;
    text-align: center;
    padding: 15px;
    font-size: 18px;
    font-weight: bold;
  }
  .chat-box {
    flex: 1;
    padding: 15px;
    overflow-y: auto;
    background-color: #f9fafb;
    display: flex;
    flex-direction: column;
  }
  .message-row { display: flex; margin: 8px 0; }
  .message {
    padding: 10px 15px;
    border-radius: 18px;
    max-width: 70%;
    font-size: 14px;
    line-height: 1.4em;
    word-break: break-word;
  }
  .my-message-row { justify-content: flex-end; }
  .my-message { background-color: #4a6cf7; color: white; border-bottom-right-radius: 4px; }
  .other-message-row { justify-content: flex-start; }
  .other-message { background-color: #e5e7eb; color: #333; border-bottom-left-radius: 4px; }
  .chat-input { display: flex; border-top: 1px solid #ddd; padding: 10px; }
  .chat-input input {
    flex: 1; border: 1px solid #ccc; border-radius: 20px;
    padding: 10px 15px; outline: none; font-size: 14px;
  }
  .chat-input button {
    background-color: #4a6cf7; color: white; border: none;
    border-radius: 20px; padding: 10px 20px; margin-left: 8px; cursor: pointer;
  }
  .chat-input button:hover { background-color: #3b5ce0; }
  .system-message { text-align: center; color: gray; font-size: 12px; margin: 5px 0; }
</style>
<script type="text/javascript">
let websocket
window.onload=(e)=>{
	connection()
}
const connection=()=>{
	websocket=new WebSocket("ws://localhost/JSPLastProject/chat")
	websocket.onopen=onOpen
	websocket.onmessage=onMessage
	websocket.onclose=onClose
}
const onOpen=(event)=>{
	alert("채팅 서버와 연결되었습니다..")
}
const onClose=(event)=>{
	alert("채팅 서버와 연결이 해제되었습니다..")
}
const onMessage=(event)=>{
	let data=event.data // 전송된 데이터
	if(data.substring(0,3)==="my:"){
		appendMyMessage(data.substring(3))
	}
	if(data.substring(0,4)==="you:"){
		appendYouMessage(data.substring(4))
	}
	if(data.substring(0,4)==="msg:"){
		appendMsgMessage(data.substring(4))
	}
}
const disConnection=()=>{
	websocket.close()
}
const appendMyMessage=(msg)=>{
	$('#chatBox').append(
		'<div class="message-row my-message-row">'
		+'<div class="message my-message">'
		+msg
		+'</div>'
		+'</div>'
	)
	$('#chatBox').scrollTop($('#chatBox').scrollHeight)
}
const appendYouMessage=(msg)=>{
	$('#chatBox').append(
		'<div class="message-row other-message-row">'
		+'<div class="message other-message">'
		+msg
		+'</div>'
		+'</div>'
	)
	$('#chatBox').scrollTop($('#chatBox').scrollHeight)
}
const appendMsgMessage=(msg)=>{
	$('#chatBox').append(
		'<div class="system-message">'+msg+'</div>'
	)
	$('#chatBox').scrollTop($('#chatBox').scrollHeight)
}
const send=()=>{
	let msg=$('#messageInput').val()
	if(msg.trim()===''){
		$('#messageInput').focus()
		return
	}
	websocket.send(msg)
	$('#messageInput').val('')
	$('#messageInput').focus()
}
$(()=>{
	$('#sendBtn').on('click',()=>{
		send()
	})
	$('#messageInput').on('keydown',function(key){
		if(key.keyCode===13){
			send()
		}
	})
})
</script>
</head>
<body>
	<div class="chat-container">
		<div class="chat-header">실시간 채팅</div>
		<div id="chatBox" class="chat-box"></div>
		<div class="chat-input">
			<input type="text" id="messageInput" placeholder="메시지를 입력하세요...">
			<button id=sendBtn>전송</button>
		</div>
	</div>
</body>
</html>