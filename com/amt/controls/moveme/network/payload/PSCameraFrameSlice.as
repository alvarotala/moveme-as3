package com.amt.controls.moveme.network.payload {
	
	import com.amt.controls.moveme.network.payload.PSPayload;
	import com.amt.controls.moveme.network.payload.PSMoveServerPacketHeader;
	
	import flash.utils.ByteArray;
	
	public class PSCameraFrameSlice extends PSPayload {
		
	    public var heightStart:int;
    
	    public var heightSlice:int;
    
	    public var sliceNum:int;
    
	    public var numSlices:int;
    
	    public var imageData:ByteArray;

	    override public function processBody(byteBuffer:ByteArray):void {
	        var offset:int = PSMoveServerPacketHeader.HEADER_SIZE;
	        this.imageData = new ByteArray();
			
			byteBuffer.position = offset;
	        this.sliceNum = byteBuffer.readByte();
	        this.numSlices = byteBuffer.readByte();
	        
			var format:int = byteBuffer.readByte();
	        this.heightSlice = 480 / this.numSlices;
	        this.heightStart = this.heightSlice * this.sliceNum;
			
	        // byteBuffer.position = offset + 3;
	        byteBuffer.readBytes(this.imageData, offset + 3);
			this.imageData.position = 0;
	    }
		
	}
}