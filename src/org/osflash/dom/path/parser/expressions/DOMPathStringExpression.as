package org.osflash.dom.path.parser.expressions
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class DOMPathStringExpression implements IDOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _value : String;
		
		public function DOMPathStringExpression(value : String)
		{
			_value = value;
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
	}
}
