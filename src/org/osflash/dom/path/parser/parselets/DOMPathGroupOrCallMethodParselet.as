package org.osflash.dom.path.parser.parselets
{
	import org.osflash.dom.path.parser.DOMPathPrecedence;
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.DOMPathCallMethodExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathGroupExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class DOMPathGroupOrCallMethodParselet implements IDOMPathInfixParselet
	{
		
		
		/**
		 * @inheritDoc
		 */
		public function parse(	parser : IDOMPathParser, 
								expression : IDOMPathExpression, 
								token : DOMPathToken
								) : IDOMPathExpression
		{
			const parameters : Vector.<IDOMPathExpression> = new Vector.<IDOMPathExpression>();
			
			if(parser.match(DOMPathTokenType.ATTRIBUTE))
			{
				// we're actually a group conditional here!
				const group : IDOMPathExpression =  parser.parseExpression();
				return new DOMPathGroupExpression(expression, group);
			}
			else
			{
				// There may be no arguments at all.
				if (!parser.match(DOMPathTokenType.RIGHT_PAREN))
				{
					do
					{
						parameters.push(parser.parseExpression());
					}
					while(parser.match(DOMPathTokenType.COMMA));
					
					parser.consumeToken(DOMPathTokenType.RIGHT_PAREN);
				}
				
				return new DOMPathCallMethodExpression(expression, parameters);
			}
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
