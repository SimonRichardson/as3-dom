package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathNumberExpression  extends DOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _value : Number;
		
		public function DOMPathNumberExpression(value : Number)
		{
			_value = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeDouble(_value);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.NUMBER;
		}

		public function get value() : Number
		{
			return _value;
		}
	}
}
