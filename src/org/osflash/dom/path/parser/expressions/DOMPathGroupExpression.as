package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathGroupExpression extends DOMPathExpression
	{
		
		
		/**
		 * @private
		 */
		private var _expressions : Vector.<IDOMPathExpression>;

		public function DOMPathGroupExpression(expressions : Vector.<IDOMPathExpression>)
		{
			if(null == expressions) throw new ArgumentError('Given expressions can not be null');
			
			_expressions = expressions;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUTF("(");
			const total : int = _expressions.length;
			for (var i : int = 0; i < total; i++)
			{
				_expressions[i].describe(stream);
			}
			stream.writeUTF(")");
		}

		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.GROUP;
		}
		
		public function get expressions() : Vector.<IDOMPathExpression>
		{
			return _expressions;
		}
		
	}
}
