package org.osflash.dom.path.parser.parselets
{
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.DOMPathNameExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathNameParselet implements IDOMPathPrefixParselet
	{

		/**
		 * @inheritDoc
		 */
		public function parse(parser : IDOMPathParser, token : DOMPathToken) : IDOMPathExpression
		{
			return new DOMPathNameExpression(token.buffer);
		}
	}
}
