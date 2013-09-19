package com.amt.controls.moveme.network {
	
	
	import flash.events.EventDispatcher;
	import com.amt.controls.moveme.network.UdpClient;
	import com.amt.controls.moveme.network.Protocol;
	import com.amt.controls.moveme.MoveMeListener;
	
	import flash.net.Socket;
	import flash.errors.*;
	import flash.events.*;
	
	import flash.utils.ByteArray;
	
	public class TcpClient extends EventDispatcher {
				
	    /**
	     * Move Me server address.
	     */
	    private var moveMeServer:String;

	    /**
	     * Move Me server port.
	     */
	    private var moveMePort:int;

	    /**
	     * Socket channel.
	     */
	    private var socketChannel:Socket;

	    /**
	     * UDP client.
	     */
	    private var udpClient:UdpClient;

	    /**
	     * True if the Tcp Client is connected to the Move Me Server.
	     */
	    private var connected:Boolean;
		
		
	    /**
	     * The constructor.
	     * 
	     * @param moveMeServer
	     *            MoveMe server host.
	     * @param moveMePort
	     *            MoveMe server port.
	     * @param localPort
	     *            UDP client local port.
	     */
			
		public function TcpClient(moveMeServer:String, moveMePort:int, localPort:int, udpClientListener:MoveMeListener):void {
		    this.connected = false;
		    this.moveMeServer = moveMeServer;
		    this.moveMePort = moveMePort;
		    this.udpClient = new UdpClient(localPort, udpClientListener);
		}
		
	    /**
	     * Init command.
	     * 
	     */
	    public function init():void {
			this.socketChannel = new Socket();
	        
			try {
				
				this.socketChannel.addEventListener(Event.CONNECT, ConnectHandler);
				this.socketChannel.addEventListener(ProgressEvent.SOCKET_DATA, DataHandler);
				
				this.socketChannel.addEventListener(IOErrorEvent.IO_ERROR, ErrorHandler);
				this.socketChannel.addEventListener(SecurityErrorEvent.SECURITY_ERROR, ErrorHandler);
				
				this.socketChannel.connect(moveMeServer, moveMePort);

	        } catch (e:Error) {
				trace("ERROR: Can´t create connection to TCP socket.");
	            this.udpClient.udpClientListener.notifyError();
	        }
	    }
		
		private function ErrorHandler(e:Event):void {
			trace("ERROR: Can´t connect to TCP socket.");
			this.udpClient.udpClientListener.notifyError();
		}
		
		private function ConnectHandler(e:Event):void {
			trace("Connected to TCP server " + moveMeServer + ":" + moveMePort);
			this.connected = true;
			
			this.udpClient.start();
						
            var payload:Array = [this.udpClient.getLocalPort()];
            this.sendCommand(Protocol.INIT, payload);
		}
		
		private function DataHandler(e:Event):void {
			
		}
		
	    /**
	     * Pause command.
	     */
	    public function pauseState():void {
	        this.sendCommand(Protocol.PAUSE_STATE);
	    }

	    /**
	     * Resume command.
	     */
	    public function resumeState():void {
	        this.sendCommand(Protocol.RESUME_STATE);
	    }

	    /**
	     * Set delay command.
	     * 
	     * @param stateDelay
	     *            Delay in milliseconds.
	     */
	    public function setStateDelay(stateDelay:int):void {
	        var payload:Array = [stateDelay];
	        this.sendCommand(Protocol.SET_STATE_DELAY, payload);
	    }

	    /**
	     * Config camera command.
	     * 
	     * @param maxExposure
	     *            Max exposure.
	     * @param imageQuality
	     *            Image quality.
	     */
	    public function configCamera(maxExposure:int, imageQuality:Number):void {
	        var payload:Array = [maxExposure, imageQuality];
	        this.sendCommand(Protocol.CONFIG_CAMERA, payload);
	    }

	    /**
	     * Calibrate a move controller.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     */
	    public function calibrate(moveControllerId:int):void {
	        var payload:Array = [moveControllerId];
	        this.sendCommand(Protocol.CALIBRATE, payload);
	    }
		
	    /**
	     * Laser left plane command.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     */
	    public function laserLeftPlane(moveControllerId:int):void {
	        var payload:Array = [moveControllerId];
	        this.sendCommand(Protocol.LASER_LEFT_PLANE, payload);
	    }

	    /**
	     * Laser right plane command.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     */
	    public function laserRightPlane(moveControllerId:int):void {
	        var payload:Array = [moveControllerId];
	        this.sendCommand(Protocol.LASER_RIGHT_PLANE, payload);
	    }

	    /**
	     * Laser bottom plane.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     */
	    public function laserBottomPlane(moveControllerId:int):void {
	        var payload:Array = [moveControllerId];
	        this.sendCommand(Protocol.LASER_BOTTOM_PLANE, payload);
	    }

	    /**
	     * Laser top plane.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     */
	    public function laserTopPlane(moveControllerId:int):void {
	        var payload:Array = [moveControllerId];
	        this.sendCommand(Protocol.LASER_TOP_PLANE, payload);
	    }

	    /**
	     * Turn on laser command.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     */
	    public function turnonLaser(moveControllerId:int):void {
	        var payload:Array = [moveControllerId];
	        this.sendCommand(Protocol.TURNON_LASER, payload);
	    }

	    /**
	     * Turn off laser command.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     */
	    public function turnoffLaser(moveControllerId:int):void {
	        var payload:Array = [moveControllerId];
	        this.sendCommand(Protocol.TURNOFF_LASER, payload);
	    }
		
	    /**
	     * Reset command.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     */
	    public function reset(moveControllerId:int):void {
	        var payload:Array = [moveControllerId];
	        this.sendCommand(Protocol.RESET, payload);
	    }

	    /**
	     * Position left plane command.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     */
	    public function positionLeftPlane(moveControllerId:int):void {
	        var payload:Array = [moveControllerId];
	        this.sendCommand(Protocol.POSITION_LEFT_PLANE, payload);
	    }

	    /**
	     * Position right plane command.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     */
	    public function positionRightPlane(moveControllerId:int):void {
	        var payload:Array = [moveControllerId];
	        this.sendCommand(Protocol.POSITION_RIGHT_PLANE, payload);
	    }

	    /**
	     * Position bottom plane command.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     */
	    public function positionBottomPlane(moveControllerId:int):void {
	        var payload:Array = [moveControllerId];
	        this.sendCommand(Protocol.POSITION_BOTTOM_PLANE, payload);
	    }

	    /**
	     * Position top plane command.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     */
	    public function positionTopPlane(moveControllerId:int):void {
	        var payload:Array = [moveControllerId];
	        this.sendCommand(Protocol.POSITION_TOP_PLANE, payload);
	    }

	    /**
	     * Turn on position command.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     */
	    public function turnonPosition(moveControllerId:int):void {
	        var payload:Array = [moveControllerId];
	        this.sendCommand(Protocol.TURNON_POSITION, payload);
	    }

	    /**
	     * Turn off position command.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     */
	    public function turnoffPosition(moveControllerId:int):void {
	        var payload:Array = [moveControllerId];
	        this.sendCommand(Protocol.TURNOFF_POSITION, payload);
	    }
		
	    /**
	     * Set sphere color command.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     * @param r
	     *            Red color (0..1)
	     * @param g
	     *            Green color (0..1)
	     * @param b
	     *            Blue color (0..1)
	     */
	    public function setSphereColor(moveControllerId:int, r:Number, g:Number, b:Number):void {
			var payload:Array = [moveControllerId, r, g, b];
	        this.sendCommand(Protocol.SET_SPHERE_COLOR, payload);
	    }

	    /**
	     * Set rumble command.
	     * 
	     * @param moveControllerId
	     *            The move controller id (0..3).
	     * @param rumble
	     *            The vibration intensity (0..255)
	     */
	    public function setRumble(moveControllerId:int, rumble:int):void {
	        var payload:Array = [moveControllerId, rumble];
	        this.sendCommand(Protocol.SET_RUMBLE, payload);
	    }
		
	    /**
	     * Set sphere track color command.
	     * 
	     * @param moveControllerId0
	     *            The move controller id (0..3).
	     * @param moveControllerId1
	     *            The move controller id (0..3).
	     * @param moveControllerId2
	     *            The move controller id (0..3).
	     * @param moveControllerId3
	     *            The move controller id (0..3).
	     */
	    public function setSphereTrackcolor(moveControllerId0:int, moveControllerId1:int, moveControllerId2:int, moveControllerId3:int):void {
	        var payload:Array = [moveControllerId0, moveControllerId1, moveControllerId2, moveControllerId3];
	        this.sendCommand(Protocol.SET_SPHERE_TRACKCOLOR, payload);
	    }
		
	    /**
	     * Set frame delay command.
	     * 
	     * @param frameDelay
	     *            The frame delay.
	     */
	    public function setFrameDelay(frameDelay:int):void {
	        var payload:Array = [frameDelay];
	        this.sendCommand(Protocol.SET_FRAME_DELAY, payload);
	    }

	    /**
	     * Set slices command.
	     * 
	     * @param slices
	     *            Slices.
	     */
	    public function setSlices(slices:int):void {
	        if (slices > 1) {
				trace("ERROR: There is no support for more than one slice yet. Sorry :(.");
	            this.udpClient.udpClientListener.notifyError();
	        } else {
	            var payload:Array = [slices];
	            this.sendCommand(Protocol.SET_SLICES, payload);
	        }
	    }

	    /**
	     * Pause frame command.
	     */
	    public function pauseFrame() {
	        this.sendCommand(Protocol.PAUSE_FRAME);
	    }

	    /**
	     * Resume frame command.
	     */
	    public function resumeFrame() {
	        this.sendCommand(Protocol.RESUME_FRAME);
	    }
		
	
	    /**
	     * Sends a generic command to the MoveMe server.
	     * 
	     * @param command
	     *            The desired command.
	     * @param payload
	     *            The payload to send.
	     */
	    private function sendCommand(command:int, payload:Array = null):void {
			if(!payload) payload = [0];
						
	        if (this.isConnected()) {
								
				var byteBuffer:ByteArray = new ByteArray();
				
				byteBuffer.writeInt(command);
	            byteBuffer.writeInt(payload.length * 4);
				
	            for (var i:int = 0; i < payload.length; i++) {
					if(int(payload[i]) !== payload[i]) {
						byteBuffer.writeFloat(payload[i]);
					}
					else {
						byteBuffer.writeInt(payload[i]);
					}
	            }
				
	            byteBuffer.position = 0;
				
	            try {
	                this.socketChannel.writeBytes(byteBuffer);
					
	            } catch (e:Error) {
					trace("ERROR: Can´t write to TCP socket.");
	                this.udpClient.udpClientListener.notifyError();
	            }
	        }
	    }

	    private function isConnected():Boolean {
	        return connected;
	    }
		      	
	}
}