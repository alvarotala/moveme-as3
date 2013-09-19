package com.amt.controls.moveme.network.payload.state {
	
	import flash.utils.ByteArray;
	
	public class PSMovePadData {

	    public var digitalbuttons:int;
    
	    public var analogT:int;
    
	    public function PSMovePadData(byteBuffer:ByteArray, idMoveController:int):void {
	        byteBuffer.position = 248 + idMoveController * 176;
			
	        digitalbuttons = byteBuffer.readShort();
	        analogT = byteBuffer.readShort();
	    }
    
	}
}