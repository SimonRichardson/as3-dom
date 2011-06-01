package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathAtrributeExpression extends DOMPathExpression
	{
		
		
		public function DOMPathAtrributeExpression()
		{
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUTF(DOMPathTokenType.getType(DOMPathTokenType.ATTRIBUTE.type));
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.ATTRIBUTE;
		}
	}
}
