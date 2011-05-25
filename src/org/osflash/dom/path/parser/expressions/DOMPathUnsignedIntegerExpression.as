package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathUnsignedIntegerExpression extends DOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _value : uint;
		
		public function DOMPathUnsignedIntegerExpression(value : int)
		{
			_value = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeInt(_value);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.UNSIGNED_INTEGER;
		}

		public function get value() : uint
		{
			return _value;
		}
	}
}
