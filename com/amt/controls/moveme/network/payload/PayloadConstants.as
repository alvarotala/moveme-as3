package com.amt.controls.moveme.network.payload {
	
	public class PayloadConstants {

	    public static const NUM_BUTTONS:int = 64;

	    public static const PSMOVE_PACKET_MAGIC:int = 0xff0000dd;

	    public static const PSMOVE_PACKET_CODE_STANDARD_STATE:int = 0x1;

	    public static const PSMOVE_PACKET_CODE_CAMERA_FRAME_SLICE:int = 0x2;

	    public static const PSMOVE_PACKET_CODE_CAMERA_FRAME_STATE:int = 0x3;

	    public static const PSMOVE_SERVER_MAX_CONS:int = 4;

	    public static const PSMOVE_SERVER_MAX_NAVS:int = 7;

	    public static const IMAGE_BUFFER_SIZE:int = 61440;

	    public static const CAMERA_FRAME_SPLIT_FORMAT_JPG:int = 0x1;

	    public static const MAXIMUM_CAMERA_FRAME_SLICES:int = 7;

	    public static const CELL_PAD_MAX_CODES:int = 64;

	}
}