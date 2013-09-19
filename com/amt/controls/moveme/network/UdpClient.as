package com.amt.controls.moveme.network {
	
	
	import flash.events.EventDispatcher;
	import com.amt.controls.moveme.network.Protocol;
	import com.amt.controls.moveme.MoveMeListener;
	
	import flash.net.DatagramSocket;
	import flash.errors.*;
	import flash.events.*;
	
	import flash.utils.ByteArray;
	
	import com.amt.controls.moveme.network.payload.PSMoveServerPacketHeader;
	import com.amt.controls.moveme.network.payload.PSCameraFrameSlice;
	import com.amt.controls.moveme.network.payload.state.PSMoveState;
	import com.amt.controls.moveme.network.payload.PayloadConstants;
	
	import flash.display.BitmapData;
	import flash.display.Loader;
	
	public class UdpClient extends EventDispatcher {
			
	    /**
	     * The max size of a packet received from MoveMe server.
	     */
	    public static const MAX_PACKET_SIZE:int = 65536;
		
	    /**
	     * Listener to receive the processed data.
	     */
	    public var udpClientListener:MoveMeListener;
		
	    /**
	     * Set the UDP client to run or not.
	     */
	    private var running:Boolean;

	    /**
	     * Local port.
	     */
	    private var localPort:int;
		
	    /**
	     * Datagram (UDP) variable
	     */
		private var datagramSocket:DatagramSocket;
		
	    /**
	     * UDP client constructor.
	     * 
	     * @param localPort
	     *            The local port to receive the data from MoveMe server.
	     * @param udpClientListener
	     *            UDP listener to receive the processed data.
	     */
	    public function UdpClient(localPort:int, udpClientListener:MoveMeListener):void {
	        this.localPort = localPort;
	        this.udpClientListener = udpClientListener;
			this.datagramSocket = new DatagramSocket();
	    }
		
	    public function start():void {	
			
			trace("Connect UDP client to port " + this.localPort);
					
			if(datagramSocket.bound) {
                datagramSocket.close();
                datagramSocket = new DatagramSocket();
			}
			
			try {
				datagramSocket.bind(this.localPort);
				datagramSocket.addEventListener(DatagramSocketDataEvent.DATA, dataReceived);
				datagramSocket.receive();
				
        	} catch (e:Error) {
				trace("ERROR: Can´t start UDP connection.");
            	this.udpClientListener.notifyError();
        	}
	    }
		
		private function dataReceived(e:DatagramSocketDataEvent):void {
			var byteBuffer:ByteArray = e.data;
			
			var magic:int = byteBuffer.readInt();

			if (PayloadConstants.PSMOVE_PACKET_MAGIC == magic) {
				var header:PSMoveServerPacketHeader = new PSMoveServerPacketHeader(byteBuffer);
								
		       
				byteBuffer.position = 0;
				
		        switch (header.payloadCode) {
					
		        case PSMoveServerPacketHeader.STANDARD_STATE_CODE:
				case PSMoveServerPacketHeader.CAMERA_STATE_CODE:
				
				 	var udpClientPayloadMoveState:PSMoveState = new PSMoveState();
					udpClientPayloadMoveState.setHeader(header);
					udpClientPayloadMoveState.processBody(byteBuffer);
					
					this.udpClientListener.processData(udpClientPayloadMoveState);
					
		            break;
					
		        case PSMoveServerPacketHeader.CAMERA_FRAME_CODE:
				
				 	var udpClientPayloadCameraFrameSlice:PSCameraFrameSlice = new PSCameraFrameSlice();
					udpClientPayloadCameraFrameSlice.setHeader(header);
					udpClientPayloadCameraFrameSlice.processBody(byteBuffer);
					
					var bmpData:BitmapData = new BitmapData(640, 480);
					var loader:Loader = new Loader();
					loader.loadBytes(udpClientPayloadCameraFrameSlice.imageData);
					bmpData.draw(loader);
						
	                this.udpClientListener.processImage(bmpData);		
					
		            break;
		        }
			}				
		}
 		
	    /**
	     * Stop the execution of the udp client.
	     */
	    public function stop():void {
	    	datagramSocket.close();
	    }

	    /**
	     * Get the local port of the udp client.
	     * 
	     * @return int Local port.
	     */
	    public function getLocalPort():int {
	        return this.localPort;
	    }

	    /**
	     * Get the current listener for the udp client.
	     * 
	     * @return MoveMeListener The current listener.
	     */
	    public function getListener():MoveMeListener {
	        return this.udpClientListener;
	    }
		
					
		
	}
}