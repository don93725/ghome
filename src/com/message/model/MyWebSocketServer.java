package com.message.model;

import java.io.*;
import java.util.*;

import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;

import javax.websocket.Session;
import javax.websocket.OnOpen;
import javax.websocket.OnMessage;
import javax.websocket.OnError;
import javax.websocket.OnClose;
import javax.websocket.CloseReason;

@ServerEndpoint("/MyWebSocketServer/{name}")
public class MyWebSocketServer {

	private static final Map<String,Session> connectedSessions = Collections.synchronizedMap(new HashMap<String,Session>());

	@OnOpen
	public void onOpen(@PathParam("name") String name, Session userSession) throws IOException {
		connectedSessions.put(name,userSession);
		String text = String.format("Session ID = %s, connected; name = %s", 
				userSession.getId(), name);
		System.out.println(text);
	}

	@OnMessage
	public void onMessage(Session userSession, String message) {
		System.out.println(message);
		Gson gson = new Gson();
		TempMsg msg = gson.fromJson(message, TempMsg.class);
		Session rcvSession = connectedSessions.get(msg.rcv_no);
		if(userSession.isOpen()){
			userSession.getAsyncRemote().sendText(message);			
		}
		if(rcvSession!=null){
			if(rcvSession.isOpen()){
				rcvSession.getAsyncRemote().sendText(message);
			}			
		}
		if(msg!=null){			
			MessageService messageService = new MessageService();
			System.out.println(msg.getRcv_no()+"-"+ msg.getPost_no()+"-"+msg.getMsg_ctx());
			messageService.add(msg.getRcv_no(), msg.getPost_no(), msg.getMsg_ctx());
		}
	}

	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		connectedSessions.remove(userSession);
	}
}
