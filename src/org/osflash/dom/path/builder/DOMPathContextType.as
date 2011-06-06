package org.osflash.dom.path.builder
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathContextType
	{

		public static const DOCUMENT : DOMPathContextType = new DOMPathContextType(0x01);

		public static const CONTEXT : DOMPathContextType = new DOMPathContextType(0x01);

		/**
		 * @private
		 */
		private var _type : int;

		public function DOMPathContextType(type : int)
		{
			_type = type;
		}
		
		/**
		 * Get the type as a string
		 * 
		 *	@param type int of unique type
		 *	@return String representation of type 
		 */
		public static function getType(type : int) : String
		{
			switch(type)
			{
				case DOCUMENT:
					return 'document';
				case CONTEXT:
					return 'context';
				default:
					return 'Unknown (type=' + type + ')';
			}
		}
		
		public function toString() : String
		{
			return '[DOMPathContextType (type=' + getType(_type) + ')]';
		}
	}
}
