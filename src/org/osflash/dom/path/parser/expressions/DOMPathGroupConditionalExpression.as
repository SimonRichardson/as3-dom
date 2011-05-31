package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathGroupConditionalExpression extends DOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _expression : IDOMPathExpression;
		
		/**
		 * @private
		 */
		private var _group : IDOMPathExpression;
		
		public function DOMPathGroupConditionalExpression(	expression : IDOMPathExpression, 
															group : IDOMPathExpression
															)
		{
			if(null == expression) throw new ArgumentError('Given expression can not be null');
			if(null == group) throw new ArgumentError('Given group can not be null');
			
			_expression = expression;
			_group = group;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			_expression.describe(stream);
			
			stream.writeUTF("(");
			_group.describe(stream);
			stream.writeUTF(")");
		}

		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.GROUP_EXPRESSION;
		}
		
		public function get expression() : IDOMPathExpression
		{
			return _expression;
		}

		public function get group() : IDOMPathExpression
		{
			return _group;
		}
	}
}
