package com.amt.controls.moveme.network.payload {
	
	import flash.utils.ByteArray;
	
	public class PSMoveServerPacketHeader {

	    public static const HEADER_SIZE:int = 20;

	    public static const STANDARD_STATE_CODE:int = 0x1;

	    public static const CAMERA_STATE_CODE:int = 0x3;

	    public static const CAMERA_FRAME_CODE:int = 0x2;

	    public var magic:int;

	    public var moveMeServerVersion:int;

	    public var payloadCode:int;

	    public var payloadLength:int;

	    public var packetIndex:int;

	    public function PSMoveServerPacketHeader(byteBuffer:ByteArray):void {
			byteBuffer.position = 0;
			
	        magic = byteBuffer.readInt();
	        moveMeServerVersion = byteBuffer.readInt();
	        payloadCode = byteBuffer.readInt();
	        payloadLength = byteBuffer.readInt();
	        packetIndex = byteBuffer.readInt();
	    }

	}
}