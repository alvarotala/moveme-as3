package com.amt.controls.moveme.network.payload.state {
	
	import flash.utils.ByteArray;
	
	public class PSMoveNavPadInfo {

	    public var portStatus:int;

	    public function PSMoveNavPadInfo(byteBuffer:ByteArray, idNavController:int):void {
	        byteBuffer.position = 1048 + idNavController * 4;
	        portStatus = byteBuffer.readInt();    
	    }
	}
	
}