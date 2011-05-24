package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathDescendantsExpression extends DOMPathExpression
	{

		public static const CONTEXT : int = 0x01;

		public static const ALL : int = 0x01;
		
		/**
		 * @private
		 */
		private var _type : int;
		
		public function DOMPathDescendantsExpression(type : int)
		{
			_type = type;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUTF("(");
			
			// TODO : workout how to write descendants here
			
			stream.writeUTF(")");
		}

		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			if(_type == ALL) return DOMPathExpressionType.ALL_DESCENDANTS;
			else return DOMPathExpressionType.DESCENDANTS;
		}
	}
}
