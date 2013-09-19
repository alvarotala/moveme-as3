package com.amt.controls.moveme.utils {

	import flash.utils.ByteArray;
	
	public class Float4 {

	    public var x:Number;

	    public var y:Number;

	    public var z:Number;

	    public var w:Number;

	    public function Float4(byteBuffer:ByteArray, offset:int):void {
			byteBuffer.position = offset;
			
	        this.x = byteBuffer.readFloat();
	        this.y = byteBuffer.readFloat();
	        this.z = byteBuffer.readFloat();
	        this.w = byteBuffer.readFloat();
	    }

	}
}