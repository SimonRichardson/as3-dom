package org.osflash.dom.path.parser.parselets.accessors
{
	import org.osflash.dom.path.DOMPathError;
	import org.osflash.dom.path.parser.DOMPathPrecedence;
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.expressions.accessors.DOMPathIndexAccessExpression;
	import org.osflash.dom.path.parser.parselets.IDOMPathInfixParselet;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathIndexAccessParselet implements IDOMPathInfixParselet
	{
		
		
		/**
		 * @inheritDoc
		 */
		public function parse(	parser : IDOMPathParser, 
								expression : IDOMPathExpression, 
								token : DOMPathToken
								) : IDOMPathExpression
		{
			var parameter : IDOMPathExpression;

			if (!parser.match(DOMPathTokenType.RIGHT_SQUARE))
			{
				parameter = parser.parseExpression();
				
				parser.consumeToken(DOMPathTokenType.RIGHT_SQUARE);
			}
			else DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
						
			if(null == parameter) DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
			
			return new DOMPathIndexAccessExpression(expression, parameter);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get precedence() : int
		{
			return DOMPathPrecedence.CALL;
		}
	}
}
