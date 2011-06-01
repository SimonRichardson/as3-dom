package org.osflash.dom.path
{
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	internal final class DOMPathContext
	{

		private var _expressions : Vector.<IDOMPathExpression>;

		public function DOMPathContext()
		{
			_expressions = new Vector.<IDOMPathExpression>();
		}

		public function pushContext(expression : IDOMPathExpression) : uint
		{
			_expressions.push(expression);

			return length;
		}

		public function popContext(expression : IDOMPathExpression) : uint
		{
			if (_expressions.pop() != expression)
				DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);

			return length;
		}
		
		public function match(type : DOMPathExpressionType) : Boolean
		{
			if(_expressions.length == 0) return false;
			
			const expression : IDOMPathExpression = _expressions[_expressions.length - 1];
			return expression.type == type;
		}
		
		public function get length() : uint
		{
			return _expressions.length;
		}
	}
}
