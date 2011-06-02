package org.osflash.dom.path.parser.expressions
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IDOMPathLeftRightNodeExpression
	{
		
		function get type() : DOMPathExpressionType;
		
		function get left() : IDOMPathExpression;
		
		function get right() : IDOMPathExpression;
	}
}
