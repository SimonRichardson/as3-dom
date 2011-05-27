package org.osflash.dom.path.parser.parselets
{
	import org.osflash.dom.path.DOMPathError;
	import org.osflash.dom.path.parser.DOMPathPrecedence;
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.DOMPathEqualityExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathStringExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class DOMPathEqualityParselet implements IDOMPathInfixParselet
	{
		
		/**
		 * @inheritDoc
		 */
		public function parse(	parser : IDOMPathParser, 
								expression : IDOMPathExpression, 
								token : DOMPathToken
								) : IDOMPathExpression
		{
			parser.consumeToken(DOMPathTokenType.EQUALITY);
			
			const right : IDOMPathExpression = parser.parseExpression();
			const name : DOMPathStringExpression = right as DOMPathStringExpression;
			if (null == name) 
				DOMPathError.throwError(DOMPathError.INVALID_EQUALITY);
				
			return new DOMPathEqualityExpression(name.value, right);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get precedence() : int
		{
			return DOMPathPrecedence.EQUALITY;
		}
	}
}
