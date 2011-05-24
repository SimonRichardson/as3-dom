package org.osflash.dom.path.parser.parselets
{
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.DOMPathPostfixExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathPostfixOperatorParselet implements IDOMPathInfixParselet
	{

		/**
		 * @private
		 */
		private var _operator : DOMPathTokenType;
		
		/**
		 * @private
		 */
		private var _precedence : int;

		public function DOMPathPostfixOperatorParselet(	operator : DOMPathTokenType, 
														precedence : int
														)
		{
			_operator = operator;
			_precedence = precedence;
		}
		
		/**
		 * @inheritDoc
		 */
		public function parse(	parser : IDOMPathParser, 
								expression : IDOMPathExpression, 
								token : DOMPathToken
								) : IDOMPathExpression
		{
			return new DOMPathPostfixExpression(expression, _operator);
		}

		/**
		 * @inheritDoc
		 */
		public function get precedence() : int
		{
			return _precedence;
		}
	}
}
