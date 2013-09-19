package com.amt.controls.moveme.network.payload.state {
	
	import flash.utils.ByteArray;
	import com.amt.controls.moveme.utils.Float4;
	
	public class PSMoveGemState {

	    public var pos:Float4;
    
	    public var vel:Float4;
    
	    public var accel:Float4;
    
	    public var quat:Float4;
    
	    public var angvel:Float4;
    
	    public var angaccel:Float4;
    
	    public var handlePos:Float4;
    
	    public var handleVel:Float4;
    
	    public var handleAccel:Float4;
    
	    public var pad:PSMovePadData; // 4 bytes
    
	    public var timestamp:Number;
    
	    public var temperature:Number;
    
	    public var cameraPitchAngle:Number;
    
	    public var trackingFlags:int;
    
	    public function PSMoveGemState(byteBuffer:ByteArray, idMoveController:int):void {
	        var offset:int = 104 + idMoveController * 176;
			
	        pos = new Float4(byteBuffer, offset);
	        vel = new Float4(byteBuffer, offset + 16);
	        accel = new Float4(byteBuffer, offset + 32);
	        quat = new Float4(byteBuffer, offset + 48);
	        angvel = new Float4(byteBuffer, offset + 64);
	        angaccel = new Float4(byteBuffer, offset + 80);
	        handlePos = new Float4(byteBuffer, offset + 96);
	        handleVel = new Float4(byteBuffer, offset + 112);
	        handleAccel = new Float4(byteBuffer, offset + 128);
	        pad = new PSMovePadData(byteBuffer, idMoveController);
			
			byteBuffer.position = offset + 152;
	        timestamp = byteBuffer.readDouble();
	        temperature = byteBuffer.readFloat();
	        cameraPitchAngle = byteBuffer.readFloat();
	        trackingFlags = byteBuffer.readInt();   
	    }
    
	}
}