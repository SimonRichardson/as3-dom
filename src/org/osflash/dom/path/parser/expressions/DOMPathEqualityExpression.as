package org.osflash.dom.path.parser.expressions
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class DOMPathEqualityExpression implements IDOMPathExpression
	{
		
		
		/**
		 * @private
		 */
		private var _value : String;
		
		/**
		 * @private
		 */
		private var _expression : IDOMPathExpression;
		
		public function DOMPathEqualityExpression(value : String, expression : IDOMPathExpression)
		{
			_value = value;
			_expression = expression;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get type() : DOMPathExpressionType
		{
			return null;
		}

		public function get value() : String
		{
			return _value;
		}

		public function get expression() : IDOMPathExpression
		{
			return _expression;
		}
	}
}
