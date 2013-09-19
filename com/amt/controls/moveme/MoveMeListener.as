package com.amt.controls.moveme {

	import com.amt.controls.moveme.network.payload.state.PSMoveState;
	import flash.display.BitmapData;
		
	public interface MoveMeListener {
	
	    /**
	     * When any error happens, this method is called.
	     */
	    function notifyError():void;

	    /**
	     * This method is called when a new packet was received and processed by the
	     * application.
	     * 
	     * @param payload
	     *            The payload object.
	     */
	    function processData(payload:PSMoveState):void;

	    /**
	     * 
	     * This method is called when a new image was received and processed by the
	     * application.
	     * 
	     * @param imageData
	     */
	    function processImage(imageData:BitmapData):void;
	
	}
}