package org.osflash.dom.path.parser.expressions.types
{
	import org.osflash.dom.path.parser.expressions.DOMPathExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	import org.osflash.stream.IStreamOutput;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathWildcardExpression extends DOMPathExpression
	{
		
		
		public function DOMPathWildcardExpression()
		{
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IStreamOutput) : void
		{
			stream.writeUTF('(');
			stream.writeUTF(DOMPathTokenType.getType(DOMPathTokenType.ASTERISK.type));
			stream.writeUTF(')');
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.WILDCARD;
		}
	}
}
