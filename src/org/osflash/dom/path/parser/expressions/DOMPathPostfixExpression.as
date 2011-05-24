package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathPostfixExpression extends DOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _left : IDOMPathExpression;
		
		/**
		 * @private
		 */
		private var _operator : DOMPathTokenType;

		public function DOMPathPostfixExpression(	left : IDOMPathExpression, 
													operator : DOMPathTokenType
													)
		{
			_left = left;
			_operator = operator;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUTF("(");
			
			_left.describe(stream);
			
			stream.writeUTF(DOMPathTokenType.getType(_operator.type));
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
