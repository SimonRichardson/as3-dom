package org.osflash.dom.path.parser.expressions
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathExpressionType
	{

		public static const WILDCARD : DOMPathExpressionType = 	new DOMPathExpressionType(0x01);
		
		public static const ALL_DESCENDANTS : DOMPathExpressionType = 
																new DOMPathExpressionType(0x02);
		
		public static const DESCENDANTS : DOMPathExpressionType = 
																new DOMPathExpressionType(0x03);
		
		public static const NAME_DESCENDANTS : DOMPathExpressionType = 
																new DOMPathExpressionType(0x04);

		public static const STRING : DOMPathExpressionType = 	new DOMPathExpressionType(0x05);
		
		public static const NAME : DOMPathExpressionType = 		new DOMPathExpressionType(0x06);

		public static const INDEX_ACCESS : DOMPathExpressionType = 
																new DOMPathExpressionType(0x07);

		public static const INTEGER : DOMPathExpressionType = 	new DOMPathExpressionType(0x08);

		public static const NUMBER : DOMPathExpressionType = 	new DOMPathExpressionType(0x09);

		public static const UNSIGNED_INTEGER : DOMPathExpressionType = 
																new DOMPathExpressionType(0x10);

		public static const ATTRIBUTE : DOMPathExpressionType = new DOMPathExpressionType(0x11);

		public static const ATTRIBUTE_DESCENDANTS : DOMPathExpressionType = 
																new DOMPathExpressionType(0x12);

		public static const CALL_METHOD : DOMPathExpressionType = 
																new DOMPathExpressionType(0x13);

		public static const GROUP_EXPRESSION : DOMPathExpressionType = 
																new DOMPathExpressionType(0x14);

		public static const CONDITIONAL_AND : DOMPathExpressionType = 
																new DOMPathExpressionType(0x15);

		public static const INSTANCE : DOMPathExpressionType = 	new DOMPathExpressionType(0x16);

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
				case NAME_DESCENDANTS.type:
					return 'nameDiscendants';
				case STRING.type:
					return 'string';
				case NAME.type:
					return 'name';
				case INDEX_ACCESS.type:
					return 'indexAccess';
				case INTEGER.type:
					return 'integer';
				case NUMBER.type:
					return 'number';
				case UNSIGNED_INTEGER.type:
					return 'unsignedInteger';
				case ATTRIBUTE.type:
					return 'attribute';
				case ATTRIBUTE_DESCENDANTS.type:
					return 'attributeDescendants';
				case CALL_METHOD.type:
					return 'callMethod';
				case GROUP_EXPRESSION.type:
					return 'groupExpression';
				case CONDITIONAL_AND.type:
					return 'conditionalAnd';
				case INSTANCE.type:
					return 'instance';
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
