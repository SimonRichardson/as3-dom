package org.osflash.dom.path.parser.expressions.types
{
	import org.osflash.dom.path.parser.expressions.DOMPathExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathUnsignedIntegerExpression extends DOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _value : uint;
		
		public function DOMPathUnsignedIntegerExpression(value : uint)
		{
			if(isNaN(value)) throw new ArgumentError('Given value can not be NaN');
			
			_value = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUnsignedInt(_value);
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
