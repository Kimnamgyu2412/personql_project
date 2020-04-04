package com.personal.project.chat.socket;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler{
	private static Logger logger = LoggerFactory.getLogger(SocketHandler.class);
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	@Resource(name = "chatService")
	com.personal.project.chat.service.chatService chatService;
	/**
     * 클라이언트 연결 이후에 실행되는 메소드
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
    	sessionList.add(session);
        logger.info("{} 연결됨", session.getId());
    }
    /**
     * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드
     */
 
    @Override
    protected void handleTextMessage(WebSocketSession session,
    		TextMessage message) throws Exception {
    	HashMap<String, String> chatMap = new HashMap<String, String>();

    	SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월dd일 HH시mm분ss초");
    	Date time = new Date();
    	
    	JSONObject object = new JSONObject(message.getPayload());
    	String chatTime = format2.format(time);
    	String chatName = object.getString("chatName");
    	String myId = object.getString("myId");
    	String yourId = object.getString("yourId");
    	String msg = object.getString("message");
    	
    	chatMap.put("myId", myId);
    	chatMap.put("yourId", yourId);
    	chatMap.put("chatContent", msg);
    	chatMap.put("chatName", chatName);
    	
    	if(chatService.saveChat(chatMap) > 0 ) {
    		for(WebSocketSession sess : sessionList){
    			sess.sendMessage(new TextMessage(msg+","+chatName+","+chatTime));
    		}
    	}
    }
    /**
     * 클라이언트가 연결을 끊었을 때 실행되는 메소드
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session,
            CloseStatus status) throws Exception {
        sessionList.remove(session);
        logger.info("{} 연결 끊김", session.getId());
    }
 
}
