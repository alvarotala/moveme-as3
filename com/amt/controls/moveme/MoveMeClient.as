package com.amt.controls.moveme {
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.amt.controls.moveme.network.TcpClient;
	import com.amt.controls.moveme.MoveMeListener;
	
	public class MoveMeClient extends EventDispatcher {
				
		private var tcpClient:TcpClient;
		
	    /**
	     * Default constructor.
	     * 
	     * @param host
	     *            The host of MoveMe server
	     * @param port
	     *            The port that the MoveMe server is listening
	     * @param localPort
	     *            The local port that will be open to the MoveMe server
	     */
		
	    public function MoveMeClient(host:String, port:int, localPort:int, udpClientListener:MoveMeListener):void {
	        this.tcpClient = new TcpClient(host, port, localPort, udpClientListener);
	    }
				
	    /**
	     * Initialize UDP data communications.
	     */
	    public function init():void {
	        this.tcpClient.init();
	    }
		
	    /**
	     * Pause standard state packet communications.
	     */
	    public function pauseState():void {
	        this.tcpClient.pauseState();
	    }

	    /**
	     * Resume standard state packet communications.
	     */
	    public function resumeState():void {
	        this.tcpClient.resumeState();
	    }

	    /**
	     * Change the delay between standard state packets.
	     * 
	     * @param stateDelay
	     *            The state delay.
	     */
	    public function setStateDelay(stateDelay:int):void {
	        this.tcpClient.setStateDelay(stateDelay);
	    }
		
	    /**
	     * Configure the PlayStation®Eye camera.
	     * 
	     * @param maxExposure
	     *            The number of image rows of exposure time. The range is from
	     *            40 to 511. The longer the exposure time means decreased image
	     *            noise but increased motion blur, which has a negative effect
	     *            on sphere tracking.
	     * @param imageQuality
	     *            An image quality control knob ranging from 0.0 to 1.0.
	     */
	    public function configCamera(maxExposure:int, imageQuality:Number):void {
	        this.tcpClient.configCamera(maxExposure, imageQuality);
	    }

	    /**
	     * Calibrate a PlayStation®Move motion controller.
	     * 
	     * @param moveControllerId
	     *            The payload is the PlayStation®Move motion controller number
	     *            (0-3). Initiates calibration of specified motion controller,
	     *            controller should be pointed at camera for best performance.
	     */
	    public function calibrate(moveControllerId:int):void {
	        this.tcpClient.calibrate(moveControllerId);
	    }

	    /**
	     * Set laser pointer left plane position.
	     * 
	     * @param moveControllerId
	     *            The payload is the PlayStation®Move motion controller number
	     *            (0-3). The motion controller should be pointed at the left
	     *            side of the display. Specifies the left side of the laser
	     *            pointer box.
	     */
	    public function laserLeftPlane(moveControllerId:int):void {
	        this.tcpClient.laserLeftPlane(moveControllerId);
	    }

	    /**
	     * Set laser pointer right plane position.
	     * 
	     * @param moveControllerId
	     *            The payload is the PlayStation®Move motion controller number
	     *            (0-3). The motion controller should be pointed at the right
	     *            side of the display. Specifies the right side of the laser
	     *            pointer box.
	     */
	    public function laserRightPlane(moveControllerId:int):void {
	        this.tcpClient.laserRightPlane(moveControllerId);
	    }

	    /**
	     * Set laser pointer bottom plane position.
	     * 
	     * @param moveControllerId
	     *            The payload is the PlayStation®Move motion controller number
	     *            (0-3). The motion controller should be pointed at the bottom
	     *            side of the display. Specifies the bottom side of the laser
	     *            pointer box.
	     */
	    public function laserBottomPlane(moveControllerId:int):void {
	        this.tcpClient.laserBottomPlane(moveControllerId);
	    }

	    /**
	     * Set laser pointer top plane position.
	     * 
	     * @param moveControllerId
	     *            The payload is the PlayStation®Move motion controller number
	     *            (0-3). The motion controller should be pointed at the top side
	     *            of the display. Specifies the top side of the laser pointer
	     *            box.
	     */
	    public function laserTopPlane(moveControllerId:int):void {
	        this.tcpClient.laserTopPlane(moveControllerId);
	    }

	    /**
	     * Enable laser pointer tracking.
	     * 
	     * @param moveControllerId
	     */
	    public function turnonLaser(moveControllerId:int):void {
	        this.tcpClient.turnonLaser(moveControllerId);
	    }

	    /**
	     * Disable laser pointer tracking.
	     * 
	     * @param moveControllerId
	     *            The payload is the PlayStation®Move motion controller number
	     *            (0-3). Disables laser pointer coordinate tracking for
	     *            specified Move.
	     */
	    public function turnoffLaser(moveControllerId:int):void {
	        this.tcpClient.turnoffLaser(moveControllerId);
	    }

	    /**
	     * Reset a PlayStation®Move motion controller.
	     * 
	     * @param moveControllerId
	     *            The payload is the PlayStation®Move motion controller number
	     *            (0-3). Resets the given motion controller.
	     */
	    public function reset(moveControllerId:int):void {
	        this.tcpClient.reset(moveControllerId);
	    }

	    /**
	     * Set position pointer left plane position.
	     * 
	     * @param moveControllerId
	     *            See laser pointer client commands. This pointer only uses the
	     *            PlayStation®Move motion controller’s position to calculate
	     *            pointer coordinates. The best real world analogy for a
	     *            position pointer is a paint brush.
	     */
	    public function positionLeftPlane(moveControllerId:int):void {
	        this.tcpClient.positionLeftPlane(moveControllerId);
	    }

	    /**
	     * Set position pointer right plane position.
	     * 
	     * @param moveControllerId
	     *            See laser pointer client commands. This pointer only uses the
	     *            PlayStation®Move motion controller’s position to calculate
	     *            pointer coordinates. The best analogy for a position pointer
	     *            is a paint brush.
	     */
	    public function positionRightPlane(moveControllerId:int):void {
	        this.tcpClient.positionRightPlane(moveControllerId);
	    }

	    /**
	     * Set position pointer bottom plane position.
	     * 
	     * @param moveControllerId
	     *            See laser pointer client commands. This pointer only uses the
	     *            PlayStation®Move motion controller’s position to calculate
	     *            pointer coordinates. The best analogy for a position pointer
	     *            is a paint brush.
	     */
	    public function positionBottomPlane(moveControllerId:int):void {
	        this.tcpClient.positionBottomPlane(moveControllerId);
	    }

	    /**
	     * Set position pointer top plane position.
	     * 
	     * @param moveControllerId
	     *            See laser pointer client commands. This pointer only uses the
	     *            PlayStation®Move motion controller’s position to calculate
	     *            pointer coordinates. The world analogy for a position pointer
	     *            is a paint brush.
	     */
	    public function positionTopPlane(moveControllerId:int):void {
	        this.tcpClient.positionTopPlane(moveControllerId);
	    }

	    /**
	     * Enable position pointer tracking.
	     * 
	     * @param moveControllerId
	     *            See laser pointer client commands. This pointer only uses the
	     *            PlayStation®Move motion controller’s position to calculate
	     *            pointer coordinates. The best analogy for a position pointer
	     *            is a paint brush.
	     */
	    public function turnonPosition(moveControllerId:int):void {
	        this.tcpClient.turnonPosition(moveControllerId);
	    }

	    /**
	     * Disable position pointer tracking.
	     * 
	     * @param moveControllerId
	     *            See laser pointer client commands. This pointer only uses the
	     *            PlayStation®Move motion controller’s position to calculate
	     *            pointer coordinates. The best analogy for a position pointer
	     *            is a paint brush.
	     */
	    public function turnoffPosition(moveControllerId:int):void {
	        this.tcpClient.turnoffPosition(moveControllerId);
	    }

	    /**
	     * Change the color of the controller move identified by the given id.
	     * 
	     * @param moveControllerId
	     *            The move controller id, can be one of (0, 1, 2 or 3)
	     * @param r
	     *            The red color (0 .. 1)
	     * @param g
	     *            The green color (0 .. 1)
	     * @param b
	     *            The blue color (0 .. 1)
	     */
	    public function setSphereColor(moveControllerId:int, r:Number, g:Number, b:Number):void {
	        this.tcpClient.setSphereColor(moveControllerId, r, g, b);
	    }

	    /**
	     * Adjust the rumble of a PlayStation®Move motion controller.
	     * 
	     * @param moveControllerId
	     *            The payload is the PlayStation®Move motion controller number
	     *            (0-3).
	     * @param rumble
	     *            The rumble value from 0 (off) to 255 (full on). When the
	     *            rumble is on, the inertial sensors inside the motion
	     *            controller are affected and lose some precision.
	     */
	    public function setRumble(moveControllerId:int, rumble:int):void {
	        this.tcpClient.setRumble(moveControllerId, rumble);
	    }
		
	    /**
	     * Change the tracking hues of all PlayStation®Move motion controllers.
	     * 
	     * The payload is the tracking hue for each of the PlayStation®Move motion
	     * controllers. All of the sphere tracking hues must set together. Each hue
	     * ranges from 0-359. The hues are only requests, Move.Me may move the hues
	     * apart from each other so that they can all be tracked.	     * 
	     * @param moveControllerId0
	     *            (0 .. 359)
	     * @param moveControllerId1
	     *            (0 .. 359)
	     * @param moveControllerId2
	     *            (0 .. 359)
	     * @param moveControllerId3
	     *            (0 .. 359)
	     */
		
	    public function setSphereTrackcolor(moveControllerId0:int, moveControllerId1:int, moveControllerId2:int, moveControllerId3:int):void {
	        this.tcpClient.setSphereTrackcolor(moveControllerId0, moveControllerId1, moveControllerId2, moveControllerId3);
	    }

	    /**
	     * Change the delay between camera frame packets.
	     * 
	     * @param frameDelay
	     *            The payload is the number of milliseconds between each camera
	     *            frame packet. This ranges from 16-255 ms.
	     */
	    public function setFrameDelay(frameDelay:int):void {
	        this.tcpClient.setFrameDelay(frameDelay);
	    }

	    /**
	     * Configure the number of horizontal slices in which each camera frame is
	     * sent.
	     * 
	     * @param slices
	     *            The payload is the number of horizontal slices each camera
	     *            frame is sent in. Each slice is sent in a separate packet.
	     *            This ranges from one to seven slices. Typically, no more than
	     *            two slices are needed.
	     */
	    public function setSlices(slices:int):void {
	        this.tcpClient.setSlices(slices);
	    }

	    /**
	     * Pause camera frame packet communications.
	     */
	    public function pauseFrame() {
	        this.tcpClient.pauseFrame();
	    }

	    /**
	     * Resume camera frame packet communications.
	     */
	    public function resumeFrame() {
	        this.tcpClient.resumeFrame();
	    }
	
	}
}