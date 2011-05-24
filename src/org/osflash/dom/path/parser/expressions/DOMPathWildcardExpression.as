package org.osflash.dom.path.parser.expressions
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathWildcardExpression implements IDOMPathExpression
	{
		
		
		public function DOMPathWildcardExpression()
		{
		}
		
		/**
		 * @inheritDoc
		 */
		public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.WILDCARD;
		}
	}
}
