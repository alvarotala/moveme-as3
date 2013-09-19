package com.amt.controls.moveme.network.payload.state {
		
	import flash.utils.ByteArray;
	
	public class PSMovePositionPointerState {
    
	    public var valid:int;
    
	    public var normalizedX:Number;
    
	    public var normalizedY:Number;
    
	    public function PSMovePositionPointerState(byteBuffer:ByteArray, idMoveController:int):void {
	        byteBuffer.position = 2100 + idMoveController * 12;
			
	        valid = byteBuffer.readInt();
	        normalizedX = byteBuffer.readFloat();
	        normalizedY = byteBuffer.readFloat();
	    }
    
	}	
}