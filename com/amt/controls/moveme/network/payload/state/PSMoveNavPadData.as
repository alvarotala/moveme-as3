package com.amt.controls.moveme.network.payload.state {
	
	import flash.utils.ByteArray;
	import com.amt.controls.moveme.network.payload.PayloadConstants;
	
	public class PSMoveNavPadData {

	    public var len:int;

	    public var button:Array;

	    public function PSMoveNavPadData(byteBuffer:ByteArray, idMoveController:int):void {
	        byteBuffer.position = 1076 + idMoveController * 132;
			
	        len = byteBuffer.readInt();
	        button = new Array();
	        for (var x:int = 0; x < PayloadConstants.NUM_BUTTONS; x++) {
				byteBuffer.position = 4 + x * 2;
	            button[x] = byteBuffer.readShort();
	        }
	    }

	}
	
	
}