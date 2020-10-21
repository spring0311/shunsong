package com.shunsong.plugin.websocketSysMsg;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.UnknownHostException;

import net.sf.json.JSONObject;

import org.java_websocket.WebSocket;
import org.java_websocket.WebSocketImpl;
import org.java_websocket.framing.Framedata;
import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.server.WebSocketServer;

/**
 * 在线管理
 * @author FH
 * QQ 313596790
 * 2015-5-25
 */
public class WebSocketSysMsgServer extends WebSocketServer{

	public WebSocketSysMsgServer(int port) throws UnknownHostException {
		super(new InetSocketAddress(port));
	}

	public WebSocketSysMsgServer(InetSocketAddress address) {
		super(address);
	}

	/**
	 * 触发连接事件
	 */
	@Override
	public void onOpen( WebSocket conn, ClientHandshake handshake ) {
		//this.sendToAll( "new connection: " + handshake.getResourceDescriptor() );
		//System.out.println("===" + conn.getRemoteSocketAddress().getAddress().getHostAddress());
	}

	/**
	 * 触发关闭事件
	 */
	@Override
	public void onClose( WebSocket conn, int code, String reason, boolean remote ) {
		this.PlanUserLeave();
	}

	/**
	 * 客户端发送消息到服务器时触发事件
	 */
	@Override
	public void onMessage(WebSocket conn, String message){
		message = message.toString();
		if(null != message && message.startsWith("[PlanUserSocket]OPEN")){
			WebSocketSysMsgServerPool.setPlanUserSocket(conn);
		}else if(null != message && message.startsWith("[PlanUserSocket]COLSE")){
			this.PlanUserLeave();
		}else{
			WebSocketSysMsgServerPool.sendMessageToUser(conn, message);//同时向本人发送消息
		}
	}

	public void onFragment( WebSocket conn, Framedata fragment ) {
	}

	/**
	 * 触发异常事件
	 */
	@Override
	public void onError( WebSocket conn, Exception ex ) {
		//ex.printStackTrace();
		if( conn != null ) {
			//some errors like port binding failed may not be assignable to a specific websocket
		}
	}

		
	/**
	 * 用户下线处理
	 * @param user
	 */
	public void PlanUserLeave(){
		WebSocketSysMsgServerPool.setPlanUserSocket(null);		
	}
	
	
	
	
	public static void main( String[] args ) throws InterruptedException , IOException {
		WebSocketImpl.DEBUG = false;
		int port = 8887; //端口
		WebSocketSysMsgServer s = new WebSocketSysMsgServer(port);
		s.start();
		//System.out.println( "服务器的端口" + s.getPort() );
	}
}

