package org.osflash.dom.path
{
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.element.IDOMNode;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPath implements IDOMPath
	{
		
		/**
		 * @private
		 */
		private var _expression : IDOMPathExpression;
		
		public function DOMPath(expression : IDOMPathExpression)
		{
			if(null == expression) throw new ArgumentError('Given value can not be null');
			_expression = expression;
		}
		
		/**
		 * @inheritDoc
		 */
		public function execute(element : IDOMElement) : Vector.<IDOMNode>
		{
			return null;
		}
	}
}
