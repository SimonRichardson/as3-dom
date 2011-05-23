package org.osflash.dom.element
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMElementType implements IDOMElementType
	{
		
		/**
		 * Base element type.
		 */
		public static const ELEMENT : DOMElementType = new DOMElementType(0x01);
		
		/**
		 * Node type of element.
		 */
		public static const NODE : DOMElementType = new DOMElementType(0x02);
		
		/**
		 * Document type of element.
		 */
		public static const DOCUMENT : DOMElementType = new DOMElementType(0x03);
		
		/**
		 * @private
		 */		
		private var _type : int;
		
		/**
		 * Constructor for the DOMElementType.
		 * 
		 * @param type used to define the element node type.
		 */
		public function DOMElementType(type : int)
		{
			_type = type;
		}

		/**
		 * @inheritDoc
		 */
		public function get type() : int
		{
			return _type;
		}
	}
}
