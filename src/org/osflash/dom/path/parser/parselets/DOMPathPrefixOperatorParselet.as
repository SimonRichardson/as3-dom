package org.osflash.dom.path.parser.parselets
{
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.DOMPathPrefixExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathPrefixOperatorParselet implements IDOMPathPrefixParselet
	{
		
		/**
		 * @private
		 */
		private var _operator : DOMPathTokenType;
		
		/**
		 * @private
		 */
		private var _precedence : int;

		public function DOMPathPrefixOperatorParselet(operator : DOMPathTokenType, precedence : int)
		{
			_operator = operator;
			_precedence = precedence;
		}
		
		/**
		 * @inheritDoc
		 */
		public function parse(parser : IDOMPathParser, token : DOMPathToken) : IDOMPathExpression
		{
			const right : IDOMPathExpression = parser.parseExpressionBy(_precedence);
			return new DOMPathPrefixExpression(_operator, right);
		}

		public function get precedence() : int
		{
			return _precedence;
		}
	}
}
