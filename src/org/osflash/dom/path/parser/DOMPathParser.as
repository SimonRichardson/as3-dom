package org.osflash.dom.path.parser
{
	import org.osflash.dom.path.DOMPathError;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.parselets.IDOMPathInfixParselet;
	import org.osflash.dom.path.parser.parselets.IDOMPathPrefixParselet;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;

	import flash.utils.Dictionary;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathParser implements IDOMPathParser
	{
		
		/**
		 * @private
		 */
		private var _tokens : IDOMPathTokenIterator;
		
		/**
		 * @private
		 */
		private var _stream : Vector.<DOMPathToken>;
		
		/**
		 * @private
		 */
		private var _prefix : Dictionary;
		
		/**
		 * @private
		 */
		private var _infix : Dictionary;
		
		public function DOMPathParser(iterator : IDOMPathTokenIterator)
		{
			_tokens = iterator;
			
			_stream = new Vector.<DOMPathToken>();
			
			_prefix = new Dictionary();
			_infix = new Dictionary();
		}
		
		/**
		 * Register a token according to a prefix parselet. 
		 */
		public function registerPrefix(	token : DOMPathTokenType, 
										parselet : IDOMPathPrefixParselet
										) : void
		{
			if(null == token) throw new ArgumentError('Given token can not be null');
			if(null == parselet) throw new ArgumentError('Given parselet can not be null');
			
			if(null != _prefix[token]) 
				DOMPathError.throwError(DOMPathError.TOKEN_ASSIGNED_ALREADY);
			
			_prefix[token] = parselet;	
		}
		
		/**
		 * Register a token according to a infix parselet. 
		 */
		public function registerInfix(	token : DOMPathTokenType, 
										parselet : IDOMPathInfixParselet
										) : void
		{
			if(null == token) throw new ArgumentError('Given token can not be null');
			if(null == parselet) throw new ArgumentError('Given parselet can not be null');
			
			if(null != _infix[token]) 
				DOMPathError.throwError(DOMPathError.TOKEN_ASSIGNED_ALREADY);
			
			_infix[token] = parselet;	
		}
		
		/**
		 * Parse an expression
		 * 
		 * @return IDOMPathExpression
		 */
		public function parseExpression() : IDOMPathExpression
		{
			return parseExpressionBy(0);
		}
		
		/**
		 * Parse an expression by the precedence of a parslet.
		 * 
		 * @return IDOMPathExpression
		 */
		public function parseExpressionBy(precedence : int) : IDOMPathExpression
		{
			var token : DOMPathToken = consume();
			if(null == token) DOMPathError.throwError(DOMPathError.TOKEN_IS_NULL);
			
			const prefix : IDOMPathPrefixParselet = _prefix[token.type];
			if(null == prefix) DOMPathError.throwError(DOMPathError.PARSER_ERROR);
			
			var expression : IDOMPathExpression = prefix.parse(this, token);
			
			while(precedence < this.precedence)
			{
				token = consume();
				
				const infix : IDOMPathInfixParselet = _infix[token.type];
				if(null == infix) DOMPathError.throwError(DOMPathError.PARSER_ERROR);
				
				expression = infix.parse(this, expression, token);
			}
			
			return expression;
		}
				
		/**
		 * @private
		 */
		public function match(expected : DOMPathTokenType) : Boolean
		{
			const token : DOMPathToken = advance(0);
			if(token.type != expected) return false;
			
			consume();
			return true;
		}
		
		/**
		 * @private
		 */
		public function consume() : DOMPathToken
		{
			advance(0);
			
			if(_stream.length == 0) DOMPathError.throwError(DOMPathError.PARSER_EXHAUSTED);
			return _stream.shift();
		}
		
		/**
		 * @private
		 */
		public function consumeToken(expected : DOMPathTokenType) : DOMPathToken
		{
			const token : DOMPathToken = advance(0);
			if(token.type != expected) DOMPathError.throwError(DOMPathError.UNEXPECTED_TOKEN);
			
			return consume();
		}
		
		/**
		 * @private
		 */
		public function advance(distance : int) : DOMPathToken
		{
			if(distance < 0) throw new RangeError('Given value can not be less than 0');
			
			while(distance >= _stream.length)
			{
				if(!_tokens.hasNext) DOMPathError.throwError(DOMPathError.PARSER_EXHAUSTED_LEXER);
				_stream.push(_tokens.next);
			}
			
			if(distance >= _stream.length) throw new RangeError('Given value can not be greater ' + 
													' than stream length (distance=' + distance + 
													', length=' + _stream.length + ')');
			return _stream[distance];
		}
		
		/**
		 * @private
		 */
		public function get precedence() : int
		{
			const token : DOMPathToken = advance(0);
			if(null == token) DOMPathError.throwError(DOMPathError.TOKEN_IS_NULL);
			
			const tokenType : DOMPathTokenType = token.type;
			const parser : IDOMPathInfixParselet = _infix[tokenType];
			return (null != parser) ? parser.precedence : 0;
		}
	}
}
