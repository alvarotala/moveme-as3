package com.amt.controls.moveme.network.payload {
	
	import com.amt.controls.moveme.network.payload.PSMoveServerPacketHeader;
	import flash.utils.ByteArray;
	
	public class PSPayload {

	    /**
	     * Payload header.
	     */
	    public var header:PSMoveServerPacketHeader;

	    /**
	     * Set the header of payload.
	     * 
	     * @param header
	     *            The header.
	     */
	    public function setHeader(header:PSMoveServerPacketHeader):void {
	        this.header = header;
	    }

	    /**
	     * Each payload type (Camera Slice, Camera State and Standard State) has to
	     * process the payload body on different ways.
	     * 
	     * @param byteBuffer
	     *            The byteBuffer instance.
	     */
	    public function processBody(byteBuffer:ByteArray):void {
			// implement on each subclass
		}

	}
}