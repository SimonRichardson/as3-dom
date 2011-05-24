package org.osflash.dom.path
{
	import org.osflash.dom.dom_namespace;
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.element.utils.getDOMElementChildrenNormalised;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;

	import flash.utils.getDefinitionByName;
		
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPath implements IDOMPath
	{
		
		public static const log : * = getDefinitionByName('trace');
		
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
			var nodes : Vector.<IDOMNode> = new Vector.<IDOMNode>();
			var elements : Vector.<IDOMElement> = Vector.<IDOMElement>([element]);
			
			var i : int;
			var index : int;
			var total : int;
			var domElement : IDOMElement;
			var domChildren : Vector.<IDOMNode>;
			
			var expression : IDOMPathExpression = _expression;
			
			switch(expression.type)
			{
				case DOMPathExpressionType.WILDCARD:
				case DOMPathExpressionType.DESCENDANTS:
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
					// TODO : check that descendants isn't the last expression, otherwise throw an syntax error
					break;
					
				case DOMPathExpressionType.ALL_DESCENDANTS:
					total = elements.length;
					for(i=0; i<total; i++)
					{
						domElement = elements[i];
						domChildren = getDOMElementChildrenNormalised(domElement);
						if(domChildren.length > 0) elements = elements.concat(domChildren);
					}
					// remove the element from elements.
					index = elements.indexOf(element);
					elements.splice(index, 1);
					break;
										
				default:
					DOMPathError.throwError(DOMPathError.INVALID_EXPRESSION);
					break;
			}
				
			return nodes;
		}
	}
}
