package com.amt.controls.moveme.network.payload.state {
		
	import flash.utils.ByteArray;
	
	public class PSMoveSphereState {
    
	    public var tracking:int;
    
	    public var trackingHue:int;
    
	    public var r:Number;
    
	    public var g:Number;
    
	    public var b:Number;

	    public function PSMoveSphereState(byteBuffer:ByteArray, idMoveController:int):void {
	        byteBuffer.position = 2000 + idMoveController * 20;
			
	        tracking = byteBuffer.readInt();
	        trackingHue = byteBuffer.readInt();
	        r = byteBuffer.readFloat();
	        g = byteBuffer.readFloat();
	        b = byteBuffer.readFloat();
	    }

	}
	
}