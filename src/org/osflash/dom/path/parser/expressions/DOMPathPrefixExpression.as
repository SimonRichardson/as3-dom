package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathPrefixExpression implements IDOMPathExpression
	{

		private var _operator : DOMPathTokenType;

		private var _right : IDOMPathExpression;

		public function DOMPathPrefixExpression(	operator : DOMPathTokenType, 
													right : IDOMPathExpression
													)
		{
			_operator = operator;
			_right = right;
		}

		public function get type() : DOMPathExpressionType
		{
			return null;
		}
	}
}
