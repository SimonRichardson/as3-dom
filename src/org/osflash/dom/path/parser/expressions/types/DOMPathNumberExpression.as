package org.osflash.dom.path.parser.expressions.types
{
	import org.osflash.dom.path.parser.expressions.DOMPathExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.stream.IStreamOutput;
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
			if(isNaN(value)) throw new ArgumentError('Given value can not be NaN');
			
			_value = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IStreamOutput) : void
		{
			stream.writeFloat(_value);
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
