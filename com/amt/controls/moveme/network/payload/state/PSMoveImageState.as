package com.amt.controls.moveme.network.payload.state {
	
	import flash.utils.ByteArray;
	
	public class PSMoveImageState {
		
	    public var frameTimestamp:Number;
    
	    public var timestamp:Number;
    
	    public var u:Number;
    
	    public var v:Number;
    
	    public var r:Number;
    
	    public var projectionx:Number;
    
	    public var projectiony:Number;
    
	    public var distance:Number;
    
	    public var visible:int;
    
	    public var rValid:int;
    
	    public function PSMoveImageState(byteBuffer:ByteArray, idMoveController:int):void {
	        byteBuffer.position = 808 + idMoveController * 48;
			
	        frameTimestamp = byteBuffer.readDouble();
	        timestamp = byteBuffer.readDouble();
	        u = byteBuffer.readFloat();
	        v = byteBuffer.readFloat();
	        r = byteBuffer.readFloat();
	        projectionx = byteBuffer.readFloat();
	        projectiony = byteBuffer.readFloat();
	        distance = byteBuffer.readFloat();
	        visible = byteBuffer.readInt();
			
			byteBuffer.position = (808 + idMoveController * 48) + 31;
	        rValid = byteBuffer.readByte();
	    }
    
	}
}