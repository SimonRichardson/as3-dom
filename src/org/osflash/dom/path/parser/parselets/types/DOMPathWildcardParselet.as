package org.osflash.dom.path.parser.parselets.types
{
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathWildcardExpression;
	import org.osflash.dom.path.parser.parselets.IDOMPathPrefixParselet;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathWildcardParselet implements IDOMPathPrefixParselet
	{
				
		/**
		 * @inheritDoc
		 */
		public function parse(parser : IDOMPathParser, token : DOMPathToken) : IDOMPathExpression
		{
			return new DOMPathWildcardExpression();
		}
	}
}
