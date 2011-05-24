package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathNameExpression extends DOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _name : String;
		
		public function DOMPathNameExpression(value : String)
		{
			_name = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUTF(_name);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.NAME;
		}

		public function get name() : String
		{
			return _name;
		}
	}
}
