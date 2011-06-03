package org.osflash.dom.element.displayadapaters
{
	import org.osflash.dom.element.DOMNode;

	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMBitmapNode extends DOMNode implements IDOMDisplayObjectNode
	{
		/**
		 * @private
		 */
		private var _bitmap : Bitmap;

		public function DOMBitmapNode(name : String)
		{
			super(name);
			
			_bitmap = new Bitmap();
			_bitmap.name = name;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get displayObject() : DisplayObject
		{
			return _bitmap;
		}
	}
}
