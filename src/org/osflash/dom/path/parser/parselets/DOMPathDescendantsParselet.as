package org.osflash.dom.path.parser.parselets
{
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.DOMPathDescendantsExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathDescendantsParselet implements IDOMPathPrefixParselet
	{
				
		/**
		 * @inheritDoc
		 */
		public function parse(parser : IDOMPathParser, token : DOMPathToken) : IDOMPathExpression
		{
			var type : int = DOMPathDescendantsExpression.CONTEXT;
			
			const isNextTokenSlash : Boolean = parser.match(DOMPathTokenType.FORWARD_SLASH);
			if(isNextTokenSlash)
				type = DOMPathDescendantsExpression.ALL;
			
			const right : IDOMPathExpression = parser.parseExpression();
			return new DOMPathDescendantsExpression(type, right);
		}
	}
}
