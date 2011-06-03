package org.osflash.dom.path.parser.parselets.types
{
	import org.osflash.dom.path.DOMPathError;
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathIntegerExpression;
	import org.osflash.dom.path.parser.parselets.IDOMPathPrefixParselet;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathIntegerParselet implements IDOMPathPrefixParselet
	{

		/**
		 * @inheritDoc
		 */
		public function parse(parser : IDOMPathParser, token : DOMPathToken) : IDOMPathExpression
		{
			const value : int = parseInt(token.buffer);
			if(isNaN(value)) DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
			
			return new DOMPathIntegerExpression(value);
		}
	}
}
