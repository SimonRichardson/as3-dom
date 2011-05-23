package org.osflash.dom.path.parser
{
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathParser
	{
		
		function parseExpression() : IDOMPathExpression;
		
		function parseExpressionBy(precedence : int) : IDOMPathExpression;
		
		function match(expected : DOMPathTokenType) : Boolean;
		
		function consumeToken(expected : DOMPathTokenType) : DOMPathToken;
	}
}
