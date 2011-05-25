package org.osflash.dom.path
{
	import org.osflash.dom.path.parser.stream.DOMPathOutputStream;
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.element.utils.getDOMElementChildren;
	import org.osflash.dom.element.utils.getDOMElementChildrenNormalised;
	import org.osflash.dom.path.parser.expressions.DOMPathDescendantsExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.expressions.DOMPathNameExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;

	import flash.utils.getDefinitionByName;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPath implements IDOMPath
	{
		// DEBUG for asunit which hides trace.
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
			var total : int;
			var domElement : IDOMElement;
			var domElements : Vector.<IDOMElement>;
			var domChild : IDOMNode;
			var domChildren : Vector.<IDOMNode>;
			
			var valid : Boolean = true;
			var expression : IDOMPathExpression = _expression;
			
			// If it's just trying to access the document directly, make sure we know 
			// element[0] is a document
			if( expression.type == DOMPathExpressionType.DESCENDANTS ||
				expression.type == DOMPathExpressionType.ALL_DESCENDANTS
				)
			{
				if(!(element is IDOMDocument)) 
				{
					if(element is IDOMNode && null != IDOMNode(element).document)
					{
						// Remove what ever element we pass in, because we know we need the document
						// node and not the context one.
						elements.splice(0, 1, IDOMNode(element).document);
					}
					else DOMPathError.throwError(DOMPathError.DOMDOCUMENT_NOT_AVAILABLE);
				}
			}
			
			// If it's just trying to access the context, add a context descendants expression
			if(	expression.type == DOMPathExpressionType.WILDCARD ||
				expression.type == DOMPathExpressionType.NAME
				)
			{
				const type : int = DOMPathDescendantsExpression.CONTEXT;
				expression = new DOMPathDescendantsExpression(type, expression);
			}
			
			const stream : IDOMPathOutputStream = new DOMPathOutputStream();
			expression.describe(stream);
			log('RAW >', stream.toString());
			
			while (valid)
			{
				switch(expression.type)
				{
					case DOMPathExpressionType.WILDCARD:
						total = elements.length;
						for (i = 0; i < total; i++)
						{
							domElement = elements[i];
							if(domElement is IDOMNode)
							{
								if(nodes.indexOf(domElement) == -1) nodes.push(domElement);
							}
							else DOMPathError.throwError(DOMPathError.INVALID_ELEMENT);
						}
						
						domElement = null;
						
						// we've finished the expression tree
						valid = false;
						break;
						
					case DOMPathExpressionType.NAME:
						// filter the elements by the name
						const nameExpression : DOMPathNameExpression = expression 
																		as DOMPathNameExpression;
						if (null == nameExpression)
							DOMPathError.throwError(DOMPathError.INVALID_EXPRESSION);
							
						total = elements.length;
						domChildren = new Vector.<IDOMNode>();
						for(i = 0; i < total; i++)
						{
							domElement = elements[i];
							if(domElement is IDOMNode)
							{
								domChild = IDOMNode(domElement);
								if(domChild.name == nameExpression.name) domChildren.push(domChild);
							}
							else DOMPathError.throwError(DOMPathError.INVALID_ELEMENT);
						}
						
						total = domChildren.length;
						for(i = 0; i < total; i++)
						{
							domChild = domChildren[i];
							if(nodes.indexOf(domChild) == -1) nodes.push(domChild);
						}
						
						domChild = null;
						domChildren = null;
						
						// we've finished the expression tree
						valid = false;
						break;
						
					case DOMPathExpressionType.ALL_DESCENDANTS:
						// clone the current items, we're going remove them on the next pass
						domElements = elements.concat();
						elements.length = 0;
						
						total = domElements.length;
						for (i = 0; i < total; i++)
						{
							domElement = domElements[i];
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
						// clone the current items, we're going remove them on the next pass
						domElements = elements.concat();
						elements.length = 0;
						
						total = domElements.length;
						for (i = 0; i < total; i++)
						{
							domElement = domElements[i];
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
