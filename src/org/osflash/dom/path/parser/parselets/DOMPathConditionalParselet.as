package org.osflash.dom.path.parser.parselets
{
	import org.osflash.dom.path.parser.DOMPathPrecedence;
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.DOMPathConditionalExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathConditionalParselet implements IDOMPathInfixParselet
	{
		
		/**
		 * @inheritDoc
		 */
		public function parse(	parser : IDOMPathParser, 
								expression : IDOMPathExpression, 
								token : DOMPathToken
								) : IDOMPathExpression
		{
			const thenArm : IDOMPathExpression = parser.parseExpression();
			
			parser.consumeToken(DOMPathTokenType.COLON);
			
			const elsePrecedence : int = DOMPathPrecedence.CONDITIONAL - 1;
			const elseArm : IDOMPathExpression = parser.parseExpressionBy(elsePrecedence);

			return new DOMPathConditionalExpression(expression, thenArm, elseArm);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get precedence() : int
		{
			return DOMPathPrecedence.CONDITIONAL;
		}
	}
}
