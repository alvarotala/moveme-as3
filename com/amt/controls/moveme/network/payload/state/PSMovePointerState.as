package com.amt.controls.moveme.network.payload.state {
		
	import flash.utils.ByteArray;
	
	public class PSMovePointerState {
		
	    public var valid:int;

	    public var normalizedX:Number;

	    public var normalizedY:Number;

	    public function PSMovePointerState(byteBuffer:ByteArray, idMoveController:int):void {
	        byteBuffer.position = 1000 + idMoveController * 12;
			
	        valid = byteBuffer.readInt();
	        normalizedX = byteBuffer.readFloat();
	        normalizedY = byteBuffer.readFloat();
	    }

	}
}