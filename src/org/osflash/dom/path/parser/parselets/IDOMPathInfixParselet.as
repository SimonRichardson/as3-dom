package org.osflash.dom.path.parser.parselets
{
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathInfixParselet
	{
		
		function parse(	parser : IDOMPathParser, 
						expression : IDOMPathExpression, 
						token : DOMPathToken
						) : IDOMPathExpression;

		function get precedence() : int;
	}
}
