package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
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
		override public function describe(stream : IDOMPathOutputStream) : void
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
