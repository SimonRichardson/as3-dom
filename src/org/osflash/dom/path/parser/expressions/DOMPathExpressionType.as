package org.osflash.dom.path.parser.expressions
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathExpressionType
	{

		public static const WILDCARD : DOMPathExpressionType = new DOMPathExpressionType(0x01);
		
		public static const ALL_DESCENDANTS : DOMPathExpressionType = 
																	new DOMPathExpressionType(0x02);
		
		public static const DESCENDANTS : DOMPathExpressionType = new DOMPathExpressionType(0x03);
		
		public static const FILTER_DESCENDANTS : DOMPathExpressionType = 
																	new DOMPathExpressionType(0x04);

		public static const STRING : DOMPathExpressionType = new DOMPathExpressionType(0x05);
		
		public static const NAME : DOMPathExpressionType = new DOMPathExpressionType(0x06);

		/**
		 * @private
		 */
		private var _type : int;
		
		/**
		 * 
		 */
		public function DOMPathExpressionType(type : int)
		{
			_type = type;
		}
		
		public static function getType(type : int) : String
		{
			switch(type)
			{
				case WILDCARD.type: 
					return 'wildcard';
				case ALL_DESCENDANTS.type: 
					return 'allDescendants';
				case DESCENDANTS.type: 
					return 'descendants';
				case FILTER_DESCENDANTS.type:
					return 'filterDiscendants';
				case STRING.type:
					return 'string';
				case NAME.type:
					return 'name';
				default:
					throw new ArgumentError('Given argument is Unknown'); 
			}
		}
		
		/**
		 * 
		 */
		public function get type() : int
		{
			return _type;
		}
	}
}
