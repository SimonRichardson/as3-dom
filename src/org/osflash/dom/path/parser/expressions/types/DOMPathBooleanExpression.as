package org.osflash.dom.path.parser.expressions.types
{
	import org.osflash.dom.path.parser.expressions.DOMPathExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathBooleanExpression extends DOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _value : Boolean;
		
		public function DOMPathBooleanExpression(value : Boolean)
		{
			_value = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeBoolean(_value);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.BOOLEAN;
		}

		public function get value() : Boolean
		{
			return _value;
		}
		
		public function toString() : String 
		{
			return "[DOMPathBooleanExpression (value='" + _value + "')]";
		}
	}
}
