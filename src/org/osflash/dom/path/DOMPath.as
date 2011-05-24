package org.osflash.dom.path
{
	import org.osflash.dom.path.parser.stream.DOMPathOutputStream;
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	import org.osflash.dom.path.parser.expressions.DOMPathNameExpression;
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.element.utils.getDOMElementChildren;
	import org.osflash.dom.element.utils.getDOMElementChildrenNormalised;
	import org.osflash.dom.path.parser.expressions.DOMPathDescendantsExpression;
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
			if (null == expression) throw new ArgumentError('Given value can not be null');

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
			var j : int;
			var total : int;
			var domElement : IDOMElement;
			var domChild : IDOMNode;
			var domChildren : Vector.<IDOMNode>;
			var numChildren : int;
			
			var valid : Boolean = true;
			var expression : IDOMPathExpression = _expression;
			
			const stream : IDOMPathOutputStream = new DOMPathOutputStream();
			expression.describe(stream);
			log(stream.toString());
			
			while (valid)
			{
				switch(expression.type)
				{
					case DOMPathExpressionType.WILDCARD:
						total = elements.length;
						for (i = 0; i < total; i++)
						{
							domElement = elements[i];
							numChildren = domElement.numChildren;

							for (j = 0; j < numChildren; j++)
							{
								domChild = domElement.getAt(j);
								if (nodes.indexOf(domChild) == -1) nodes.push(domChild);
							}
						}
						
						domChild = null;
						domElement = null;
						numChildren = 0;
						
						// we've finished the expression tree
						valid = false;
						break;
						
					case DOMPathExpressionType.NAME:
						// filter the elements by the name
						const nameExpression : DOMPathNameExpression = expression 
																		as DOMPathNameExpression;
						if (null == nameExpression)
							DOMPathError.throwError(DOMPathError.INVALID_EXPRESSION);
							
						total = nodes.length;
						domChildren = new Vector.<IDOMNode>();
						for(i = 0; i < total; i++)
						{
							domChild = nodes[i];
							if(domChild.name == nameExpression.name) domChildren.push(domChild);
						}
						
						nodes = domChildren.concat();
						
						domChildren = null;
						
						// we've finished the expression tree
						valid = false;
						break;
						
					case DOMPathExpressionType.ALL_DESCENDANTS:
						total = elements.length;
						for (i = 0; i < total; i++)
						{
							domElement = elements[i];
							domChildren = getDOMElementChildrenNormalised(domElement);
							if (domChildren.length > 0) elements = elements.concat(domChildren);
						}
						
						domElement = null;
						domChildren = null;
						
						// move to the next expression
						const allDescendantsExpression : DOMPathDescendantsExpression = expression 
																	as DOMPathDescendantsExpression;
						if (null == allDescendantsExpression)
							DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
						expression = allDescendantsExpression.descendants;
						break;
					
					case DOMPathExpressionType.DESCENDANTS:
						total = elements.length;
						for (i = 0; i < total; i++)
						{
							domElement = elements[i];
							domChildren = getDOMElementChildren(domElement);
							if (domChildren.length > 0) elements = elements.concat(domChildren);
						}
						
						domElement = null;
						domChildren = null;
						
						// move to the next expression
						const descendantsExpression : DOMPathDescendantsExpression = expression 
																	as DOMPathDescendantsExpression;
						if (null == descendantsExpression)
							DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
						expression = descendantsExpression.descendants;
						break;
					
					case DOMPathExpressionType.FILTER_DESCENDANTS:
						
						getDefinitionByName('trace')("filter");
						
						break;
						
					default:
						DOMPathError.throwError(DOMPathError.INVALID_EXPRESSION);
						break;
				}
			}

			return nodes;
		}
	}
}
