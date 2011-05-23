package org.osflash.dom.path.parser
{
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathParser
	{
		
		function parseExpression() : IDOMPathExpression;
		
		function parseExpressionBy(precedence : int) : IDOMPathExpression;
	}
}
