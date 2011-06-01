package org.osflash.dom.element.displayadapaters
{
	import org.osflash.dom.element.DOMNode;

	import flash.display.DisplayObject;
	import flash.display.Shape;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMShapeNode extends DOMNode implements IDOMDisplayObjectNode
	{
		/**
		 * @private
		 */
		private var _shape : Shape;

		public function DOMShapeNode(name : String)
		{
			super(name);
			
			_shape = new Shape();
			_shape.name = name;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get displayObject() : DisplayObject
		{
			return _shape;
		}
	}
}
