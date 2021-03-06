package de.headione.ui.buttons {
	import de.headione.interfaces.IManager;
	import de.headione.ui.CoreInteractiveManager;

	import com.greensock.TweenLite;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * @author Norman Sander, 2012
	 */
	[Event(name="button_clicked", type="de.headione.events.ControllerEvent")]
	public class ButtonManager extends CoreInteractiveManager implements IManager {

		protected var _selected : Boolean = false;
		protected var _enabled : Boolean = false;

		public function ButtonManager( displayObject : MovieClip ) {
			super( displayObject );
		}

		override protected function setup() : void {
			super.setup();
			_do.stop();
		}

		override protected function onMouseOver( event : MouseEvent ) : void {
			if (!_selected)
				_do.gotoAndStop( 2 );
			TweenLite.killDelayedCallsTo( onTooltip );
			TweenLite.delayedCall( .5, onTooltip );
		}

		override protected function onMouseOut( event : MouseEvent ) : void {
			if (!_selected)
				_do.gotoAndStop( 1 );
			TweenLite.killDelayedCallsTo( onTooltip );
			onTooltipHide();
		}

		public function get selected() : Boolean {
			return _selected;
		}

		public function set selected( selected : Boolean ) : void {
			_selected = selected;
			var f : Number = _selected ? 2 : 1;
			_do.gotoAndStop( f );
		}

		public function get enabled() : Boolean {
			return _enabled;
		}

		public function set enabled( enabled : Boolean ) : void {
			_enabled = enabled;
			_do.mouseEnabled = _enabled;
			_do.alpha = _enabled ? 1 : .5;
		}
	}
}
