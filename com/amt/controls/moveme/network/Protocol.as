package com.amt.controls.moveme.network {

	public class Protocol {

	    /**
	     * Initialize UDP data communications
	     */
	    public static const INIT:int = 0x0;

	    /**
	     * Pause standard state packet communications
	     */
	    public static const PAUSE_STATE:int = 0x1;

	    /**
	     * Resume standard state packet communications
	     */
	    public static const RESUME_STATE:int = 0x2;

	    /**
	     * Change the delay between standard state packets
	     */
	    public static const SET_STATE_DELAY:int = 0x3;

	    /**
	     * Configure the PS Eye camera
	     */
	    public static const CONFIG_CAMERA:int = 0x4;

	    /**
	     * Calibrate a PlayStation®Move motion controller
	     */
	    public static const CALIBRATE:int = 0x5;

	    /**
	     * Set laser pointer left plane position
	     */
	    public static const LASER_LEFT_PLANE:int = 0x7;

	    /**
	     * Set laser pointer right plane position
	     */
	    public static const LASER_RIGHT_PLANE:int = 0x8;

	    /**
	     * Set laser pointer bottom plane position
	     */
	    public static const LASER_BOTTOM_PLANE:int = 0x9;

	    /**
	     * Set laser pointer top plane position
	     */
	    public static const LASER_TOP_PLANE:int = 0x10;

	    /**
	     * Enable laser pointer tracking
	     */
	    public static const TURNON_LASER:int = 0x11;

	    /**
	     * Disable laser pointer tracking
	     */
	    public static const TURNOFF_LASER:int = 0x12;

	    /**
	     * Reset a PlayStation®Move motion controller
	     */
	    public static const RESET:int = 0x13;

	    /**
	     * Set position pointer left plane position
	     */
	    public static const POSITION_LEFT_PLANE:int = 0x14;

	    /**
	     * Set position pointer right plane position
	     */
	    public static const POSITION_RIGHT_PLANE:int = 0x15;

	    /**
	     * Set position pointer bottom plane position
	     */
	    public static const POSITION_BOTTOM_PLANE:int = 0x16;

	    /**
	     * Set position pointer top plane position
	     */
	    public static const POSITION_TOP_PLANE:int = 0x17;

	    /**
	     * Enable position pointer tracking
	     */
	    public static const TURNON_POSITION:int = 0x18;

	    /**
	     * Disable position pointer tracking
	     */
	    public static const TURNOFF_POSITION:int = 0x19;

	    /**
	     * Force the sphere to an explicit R,G,B color
	     */
	    public static const SET_SPHERE_COLOR:int = 0x20;

	    /**
	     * Adjust the rumble of a PlayStationMove motion controller
	     */
	    public static const SET_RUMBLE:int = 0x21;

	    /**
	     * Change the tracking hues of all PlayStation®Move motion controllers
	     */
	    public static const SET_SPHERE_TRACKCOLOR:int = 0x22;

	    /**
	     * Change the delay between camera frame packets
	     */
	    public static const SET_FRAME_DELAY:int = 0x23;

	    /**
	     * Configure the number of horizontal slices each camera frame is sent in
	     */
	    public static const SET_SLICES:int = 0x24;

	    /**
	     * Pause camera frame packet communications
	     */
	    public static const PAUSE_FRAME:int = 0x25;

	    /**
	     * Resume camera frame packet communications
	     */
	    public static const RESUME_FRAME:int = 0x26;
	}
}
