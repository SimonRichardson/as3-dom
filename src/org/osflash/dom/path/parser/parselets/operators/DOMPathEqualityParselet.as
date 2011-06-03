package org.osflash.dom.path.parser.parselets.operators
{
	import org.osflash.dom.path.DOMPathError;
	import org.osflash.dom.path.parser.DOMPathPrecedence;
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathLeftRightNodeExpression;
	import org.osflash.dom.path.parser.expressions.opterators.DOMPathEqualityExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathNameExpression;
	import org.osflash.dom.path.parser.parselets.IDOMPathInfixParselet;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class DOMPathEqualityParselet implements IDOMPathInfixParselet
	{
		
		/**
		 * @inheritDoc
		 */
		public function parse(	parser : IDOMPathParser, 
								expression : IDOMPathExpression, 
								token : DOMPathToken
								) : IDOMPathExpression
		{
			parser.consumeToken(DOMPathTokenType.EQUALITY);
			
			const name : DOMPathNameExpression = expression as DOMPathNameExpression;
			if(null == name)
				DOMPathError.throwError(DOMPathError.INVALID_LEFT_SIDE_EQUALITY);
			
			const right : IDOMPathExpression = parser.parseExpression();
			
			// Make sure we're a valid value to check against.
			var equalityType : DOMPathExpressionType= right.type; 
			if(	right.type == DOMPathExpressionType.LOGICAL_AND ||
				right.type == DOMPathExpressionType.LOGICAL_OR
				)
			{
				equalityType = IDOMPathLeftRightNodeExpression(right).left.type;
			}
			
			// For now we should be make sure we're one of the following.
			if(	!(	equalityType == DOMPathExpressionType.STRING ||
					equalityType == DOMPathExpressionType.INTEGER || 
					equalityType == DOMPathExpressionType.UNSIGNED_INTEGER ||
					equalityType == DOMPathExpressionType.NUMBER
				))
			{
				DOMPathError.throwError(DOMPathError.INVALID_RIGHT_SIDE_EQUALITY);
			}
			
			return new DOMPathEqualityExpression(name, right);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get precedence() : int
		{
			return DOMPathPrecedence.EQUALITY;
		}
	}
}
