package org.osflash.dom.path.parser.expressions.types
{
	import org.osflash.dom.path.parser.expressions.DOMPathExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.stream.IStreamOutput;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathIntegerExpression extends DOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _value : int;
		
		public function DOMPathIntegerExpression(value : int)
		{
			if(isNaN(value)) throw new ArgumentError('Given value can not be NaN');
			
			_value = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IStreamOutput) : void
		{
			stream.writeInt(_value);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.INTEGER;
		}

		public function get value() : int
		{
			return _value;
		}
	}
}
