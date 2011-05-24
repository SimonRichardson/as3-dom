package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
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
		
		/**
		 * @private
		 */
		private var _descendants : IDOMPathExpression;
		
		public function DOMPathDescendantsExpression(type : int, descendants : IDOMPathExpression)
		{
			_type = type;
			_descendants = descendants;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUTF("(");
			
			const slash : String = DOMPathTokenType.getType(DOMPathTokenType.FORWARD_SLASH.type);
			if(_type == ALL)
			{
				stream.writeUTF(slash);
				stream.writeUTF(slash);
			}
			else stream.writeUTF(slash);
			
			_descendants.describe(stream);
			
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

		public function get descendants() : IDOMPathExpression
		{
			return _descendants;
		}
	}
}
