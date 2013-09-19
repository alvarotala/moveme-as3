package com.amt.controls.moveme.network.payload.state {
	
	import flash.utils.ByteArray;
	
	public class PSMoveServerConfig {
		
	    public var numImageSlices:int;
    
	    public var imageSliceFormat:int;
    
	    public function PSMoveServerConfig(byteBuffer:ByteArray):void {
			byteBuffer.position = 24;
	        this.numImageSlices = byteBuffer.readInt();
	        this.imageSliceFormat = byteBuffer.readInt();
	    } 
				
	}
}