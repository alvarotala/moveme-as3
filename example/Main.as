package {

	import flash.display.MovieClip;
	import com.amt.controls.moveme.MoveMeClient;
	import com.amt.controls.moveme.MoveMeListener;
	import com.amt.controls.moveme.network.payload.state.PSMoveState;
	import flash.display.BitmapData;
	
	import flash.events.MouseEvent;
	
	public class Main extends MovieClip implements MoveMeListener {
	
		private var moveme:MoveMeClient;
		private var idController:int;
		
		public function Main():void {
			moveme = new MoveMeClient("192.168.1.103", 7899,5566, this);
			moveme.init();
			
			idController = 0;
			
			btn0.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
				moveme.setRumble(idController, 0);
			});
			
			btn1.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) {
				moveme.setRumble(idController, 100);
			});
			
		}
		
	    public function notifyError():void {
			trace("Error");
		}

	    public function processData(payload:PSMoveState):void {
			
			var posX:Number = payload.moveImageState[idController].projectionx;
			var posY:Number = payload.moveImageState[idController].projectiony;
    	
			trace("POS: X["+posX+"] Y["+posY+"]");
			
		}

	    public function processImage(imageData:BitmapData):void {
			// trace("processImage");
		}
		
	
	}
}