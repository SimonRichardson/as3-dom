package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
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
			_value = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUTF(_value);
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
	}
}
