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
			if(null == value) throw new ArgumentError('Given value can not be null');
			if(null == expression) throw new ArgumentError('Given expression can not be null');
			
			_value = value;
			_expression = expression;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUTF(_value);
			stream.writeUTF("==");
			
			_expression.describe(stream);			
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
