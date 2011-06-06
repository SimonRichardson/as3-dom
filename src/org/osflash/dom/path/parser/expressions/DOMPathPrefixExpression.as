package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	import org.osflash.dom.path.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathPrefixExpression extends DOMPathExpression
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
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUTF("(");
			stream.writeUTF(DOMPathTokenType.getType(_operator.type));
			
			_right.describe(stream);
			
			stream.writeUTF(")");
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return null;
		}
	}
}
