package org.osflash.dom.path
{
	import org.osflash.dom.dom_namespace;
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
		
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
			const elements : Vector.<IDOMElement> = Vector.<IDOMElement>([element]);
			
			var nodes : Vector.<IDOMNode> = new Vector.<IDOMNode>();
			
			var i : int;
			var total : int;
			var domElement : IDOMElement;
			var domChildren : Vector.<IDOMNode>;
			
			switch(_expression.type)
			{
				case DOMPathExpressionType.WILDCARD:
					total = elements.length;
					for(i=0; i<total; i++)
					{
						domElement = elements[i];
						if(domElement.numChildren > 0)
						{
							domChildren = domElement.dom_namespace::children;
							nodes = nodes.concat(domChildren);
						}
					}
					break;
				default:
					DOMPathError.throwError(DOMPathError.INVALID_EXPRESSION);
					break;
			}
			
			return nodes;
		}
	}
}
