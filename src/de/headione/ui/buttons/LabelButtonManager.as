package de.headione.ui.buttons {
	import de.headione.interfaces.IManager;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextFieldAutoSize;
	/**
	 * @author Norman Sander, 2012
	 */
	[Event(name="button_clicked", type="de.headione.events.ControllerEvent")]
	public class LabelButtonManager extends ButtonManager implements IManager {

		protected var _label : String;
		protected var _align : String;
		private var _xCenter : int;
		private var _xRight : int;

		public function LabelButtonManager( displayObject : MovieClip, label : String, align : String = "left" ) {
			_label = label;
			_align = align;
			_xCenter = int( displayObject.x + displayObject.width / 2 );
			_xRight = int( displayObject.x + displayObject.width );
			super( displayObject );
		}

		override protected function setup() : void {
			super.setup();
			_do._tf.autoSize = TextFieldAutoSize.LEFT;
			_do._tf.text = _label;
			var bgWidth : int = _do._tf.width < 80 ? 80 : _do._tf.width;
			bgWidth += 40;
			_do._bgNormal.width = _do._bgHover.width = bgWidth;
			_do._tf.x = bgWidth / 2 - _do._tf.width / 2;
			switch(_align) {
				case "right":
					_do.x = _xRight - int( _do.width );
					break;
				case "center":
					_do.x = _xCenter - int( _do.width / 2 );
					break;
			}
			onMouseOut( null );
		}

		override protected function onMouseOver( event : MouseEvent ) : void {
			_do._bgHover.visible = true;
			_do._bgNormal.visible = false;
		}

		override protected function onMouseOut( event : MouseEvent ) : void {
			_do._bgHover.visible = false;
			_do._bgNormal.visible = true;
		}
	}
}
