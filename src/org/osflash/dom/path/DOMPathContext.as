package org.osflash.dom.path
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	internal final class DOMPathContext
	{

		private var _contexts : Vector.<DOMPathContextObject>;

		public function DOMPathContext()
		{
			_contexts = new Vector.<DOMPathContextObject>();
		}

		public function pushContext(	expression : IDOMPathExpression,
										domNodes : Vector.<IDOMNode>
										) : uint
		{
			_contexts.push(new DOMPathContextObject(expression, domNodes));

			return length;
		}

		public function popContext(expression : IDOMPathExpression) : uint
		{
			const context : DOMPathContextObject = _contexts.pop();
			if (context.expression != expression)
				DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);

			return length;
		}
		
		public function match(type : DOMPathExpressionType) : Boolean
		{
			if(_contexts.length == 0) return false;
			
			const expression : IDOMPathExpression = _contexts[_contexts.length - 1].expression;
			return expression.type == type;
		}
		
		public function get length() : uint
		{
			return _contexts.length;
		}
	}
}
import org.osflash.dom.element.IDOMNode;
import org.osflash.dom.path.parser.expressions.IDOMPathExpression;

internal class DOMPathContextObject
{
	public var expression : IDOMPathExpression;
	
	public var domNodes : Vector.<IDOMNode>;

	public function DOMPathContextObject(	expression : IDOMPathExpression, 
											domNodes : Vector.<IDOMNode>
											)
	{
		this.expression = expression;
		this.domNodes = domNodes;
	}

}