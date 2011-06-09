package org.osflash.dom.path.parser.expressions.types
{
	import org.osflash.dom.path.parser.expressions.DOMPathExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.stream.IStreamOutput;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class DOMPathStringExpression extends DOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _value : String;
		
		public function DOMPathStringExpression(value : String)
		{
			if(null == value) throw new ArgumentError('Given value can not be null');
			
			_value = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IStreamOutput) : void
		{
			stream.writeUTF('"');
			stream.writeUTF(_value);
			stream.writeUTF('"');
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.STRING;
		}

		public function get value() : String
		{
			return _value;
		}
		
		public function toString() : String 
		{
			return "[DOMPathStringExpression (value='" + value + "')]";
		}
	}
}
