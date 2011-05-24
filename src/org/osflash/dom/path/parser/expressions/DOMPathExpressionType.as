package org.osflash.dom.path.parser.expressions
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathExpressionType
	{

		public static const WILDCARD : DOMPathExpressionType = new DOMPathExpressionType(0x01);
		
		public static const ALL_DESCENDANTS : DOMPathExpressionType = new DOMPathExpressionType(0x02);
		
		public static const DESCENDANTS : DOMPathExpressionType = new DOMPathExpressionType(0x03);

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
		
		/**
		 * 
		 */
		public function get type() : int
		{
			return _type;
		}
	}
}
