package org.osflash.dom.path.parser.parselets
{
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class DOMPathGroupParselet implements IDOMPathPrefixParselet
	{
		
		/**
		 * @inheritDoc
		 */
		public function parse(parser : IDOMPathParser, token : DOMPathToken) : IDOMPathExpression
		{
			const expression : IDOMPathExpression = parser.parseExpression();
			parser.consumeToken(DOMPathTokenType.RIGHT_PAREN);
			return expression;
		}
	}
}
