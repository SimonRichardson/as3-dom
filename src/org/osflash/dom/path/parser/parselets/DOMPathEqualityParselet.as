package org.osflash.dom.path.parser.parselets
{
	import org.osflash.dom.path.DOMPathError;
	import org.osflash.dom.path.parser.expressions.DOMPathEqualityExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathStringExpression;
	import org.osflash.dom.path.parser.DOMPathPrecedence;
	import org.osflash.dom.path.parser.parselets.IDOMPathInfixParselet;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;

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
			const precedence : int = DOMPathPrecedence.EQUALITY - 1;
			const right : IDOMPathExpression = parser.parseExpressionBy(precedence);

			if (!(expression is DOMPathStringExpression)) 
				DOMPathError.throwError(DOMPathError.INVALID_EQUALITY);

			const name : String = DOMPathStringExpression(expression).value;
			return new DOMPathEqualityExpression(name, right);
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
