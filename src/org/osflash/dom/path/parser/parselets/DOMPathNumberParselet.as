package org.osflash.dom.path.parser.parselets
{
	import org.osflash.dom.path.DOMPathError;
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.DOMPathNumberExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathNumberParselet  implements IDOMPathPrefixParselet
	{

		/**
		 * @inheritDoc
		 */
		public function parse(parser : IDOMPathParser, token : DOMPathToken) : IDOMPathExpression
		{
			const value : Number = parseFloat(token.buffer);
			if(isNaN(value)) DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
			
			return new DOMPathNumberExpression(value);
		}
	}
}
