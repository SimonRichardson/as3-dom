package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class DOMPathEqualityExpression extends DOMPathExpression
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
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUTF("(");
			
			stream.writeUTF(_value);
			stream.writeUTF(" = ");
			
			_expression.describe(stream);			
			
			stream.writeUTF(")");
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
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
