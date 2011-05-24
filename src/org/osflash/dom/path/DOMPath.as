package org.osflash.dom.path
{
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;
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

			var expression : IDOMPathExpression = _expression;
			while (expression)
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
						break;
						
					case DOMPathExpressionType.ALL_DESCENDANTS:
						total = elements.length;
						for (i = 0; i < total; i++)
						{
							domElement = elements[i];
							domChildren = getDOMElementChildrenNormalised(domElement);
							if (domChildren.length > 0) elements = elements.concat(domChildren);
						}
						// move to the next expression
						const descendantsExpression : DOMPathDescendantsExpression = expression 
																	as DOMPathDescendantsExpression;
						if (null == descendantsExpression)
							DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
						expression = descendantsExpression.descendants;
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
