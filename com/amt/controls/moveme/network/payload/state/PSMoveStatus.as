package com.amt.controls.moveme.network.payload.state {
	
	import flash.utils.ByteArray;
	
	public class PSMoveStatus {
		
	    public var connected:int;
    
	    public var code:int;
    
	    public var flags:Number;
    
	    public function PSMoveStatus(byteBuffer:ByteArray, idMoveController:int):void {
	        byteBuffer.position = 40 + (idMoveController * 16);
	        this.connected = byteBuffer.readInt();
	        this.code = byteBuffer.readInt();
	        this.flags = byteBuffer.readDouble();
	    }
	   
				
	}
}