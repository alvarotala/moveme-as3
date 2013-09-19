package com.amt.controls.moveme.network.payload.state {
	
	import com.amt.controls.moveme.network.payload.PSPayload;
	import com.amt.controls.moveme.network.payload.PayloadConstants;
	
	import flash.utils.ByteArray;
	
	public class PSMoveState extends PSPayload {
		
	    /**
	     * Server config
	     */
	    public var serverConfig:PSMoveServerConfig;
		
	    /**
	     * Move status, one for each move (0..3)
	     */
	    public var moveStatus:Array;

	    /**
	     * Gem state, one for each move (0..3)
	     */
	    public var moveGemState:Array;

	    /**
	     * Image state, one for each move (0..3)
	     */
	    public var moveImageState:Array;

	    /**
	     * Pointer state, one for each move (0..3)
	     */
	    public var movePointerState:Array;

	    /**
	     * Pointer sphere state, one for each move (0..3)
	     */
	    public var moveSphereState:Array;

	    /**
	     * Pointer position state, one for each move (0..3)
	     */
	    public var movePositionPointerState:Array;

	    /**
	     * Move navigation data, one for each controller (0..6)
	     */
	    public var moveNavPadData:Array;

	    /**
	     * Move navigation data info, one for each controller (0..6)
	     */
	    public var moveNavPadInfo:Array;
		
	    override public function processBody(byteBuffer:ByteArray):void {
			
	        serverConfig = new PSMoveServerConfig(byteBuffer);
			
	        moveStatus = new Array();
	        moveGemState = new Array();
	        moveImageState = new Array();
	        movePointerState = new Array();
	        moveSphereState = new Array();
	        movePositionPointerState = new Array();
			moveNavPadInfo = new Array();
			moveNavPadData = new Array();
			
			var i:int;
	        for (i = 0; i < PayloadConstants.PSMOVE_SERVER_MAX_CONS; i++) {
	            moveStatus[i] = new PSMoveStatus(byteBuffer, i);
	            moveGemState[i] = new PSMoveGemState(byteBuffer, i);
	            moveImageState[i] = new PSMoveImageState(byteBuffer, i);
	            movePointerState[i] = new PSMovePointerState(byteBuffer, i);
	            moveSphereState[i] = new PSMoveSphereState(byteBuffer, i);
	            movePositionPointerState[i] = new PSMovePositionPointerState(byteBuffer, i);
	        }
			
	        for (i = 0; i < PayloadConstants.PSMOVE_SERVER_MAX_NAVS; i++) {
		        moveNavPadInfo[i] = new PSMoveNavPadInfo(byteBuffer, i);
		        moveNavPadData[i] = new PSMoveNavPadData(byteBuffer, i);
	        }
	    }
		
	}
}