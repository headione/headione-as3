package de.headione.ui.buttons {
	import de.headione.interfaces.IManager;

	import com.greensock.TweenLite;

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	/**
	 * @author Norman Sander, 2012
	 */
	public class MuteButtonManager extends ButtonManager implements IManager {

		public function MuteButtonManager( displayObject : MovieClip ) {
			super( displayObject );
		}

		override protected function setup() : void {
			super.setup();
			_do._bg.alpha = 0;
		}

		override protected function onMouseOver( event : MouseEvent ) : void {
			_do._bg.alpha = 1;
			TweenLite.killDelayedCallsTo( onTooltip );
			TweenLite.delayedCall( .5, onTooltip );
		}

		override protected function onMouseOut( event : MouseEvent ) : void {
			_do._bg.alpha = 0;
			TweenLite.killDelayedCallsTo( onTooltip );
			onTooltipHide();
		}

		override public function set enabled( enabled : Boolean ) : void {
			_enabled = enabled;
			_do.mouseEnabled = _enabled;
		}

		override public function set selected( selected : Boolean ) : void {
			_selected = selected;
			_do._stroke.visible = !selected;
		}
	}
}