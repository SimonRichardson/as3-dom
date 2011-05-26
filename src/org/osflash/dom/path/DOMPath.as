package org.osflash.dom.path
{
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.element.utils.getAllDOMElementChildren;
	import org.osflash.dom.element.utils.getDOMElementChildren;
	import org.osflash.dom.path.parser.expressions.DOMPathAttributeDescendantsExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathAttributeExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathDescendantsExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.expressions.DOMPathIndexAccessExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathNameDescendantsExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathNameExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathUnsignedIntegerExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathWildcardExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.stream.DOMPathByteArrayOutputStream;
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;

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
				expression.type == DOMPathExpressionType.NAME ||
				expression.type == DOMPathExpressionType.NAME_DESCENDANTS ||
				expression.type == DOMPathExpressionType.ATTRIBUTE ||
				expression.type == DOMPathExpressionType.ATTRIBUTE_DESCENDANTS ||
				expression.type == DOMPathExpressionType.INDEX_ACCESS
				)
			{
				const type : int = DOMPathDescendantsExpression.CONTEXT;
				expression = new DOMPathDescendantsExpression(type, expression);
			}
			
			const stream : IDOMPathOutputStream = new DOMPathByteArrayOutputStream();
			expression.describe(stream);
			log('RAW >', stream.toString());
			
			// common expr.
			var nameExpr : DOMPathNameExpression;
			var attribExpr : DOMPathAttributeExpression;
			var indexAccessExpr : DOMPathIndexAccessExpression;
			var filterDescExpr : DOMPathNameDescendantsExpression;
			var unsignedIntegerExpr : DOMPathUnsignedIntegerExpression;
			
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
						
					case DOMPathExpressionType.ATTRIBUTE:
						
						if(expression is DOMPathAttributeExpression)
						{
							attribExpr = expression as DOMPathAttributeExpression;
							if(attribExpr.attribute is DOMPathIndexAccessExpression)
							{
								indexAccessExpr = attribExpr.attribute as 
																	DOMPathIndexAccessExpression;
								
								nameExpr = indexAccessExpr.name as DOMPathNameExpression;
								if(null == nameExpr) 
									DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
								
								domElements = elements.concat();
								elements.length = 0;
								
								domChildren = filterByAttribute(domElements, nameExpr);
							
								total = domChildren.length;
								for(i = 0; i < total; i++)
								{
									domChild = domChildren[i];
									if(nodes.indexOf(domChild) == -1) nodes.push(domChild);
								}
								
								// check that the internal part is a unsigned integer.
								unsignedIntegerExpr = indexAccessExpr.parameter as 
																DOMPathUnsignedIntegerExpression;
																
								if (null == unsignedIntegerExpr)
									DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
								if(isNaN(unsignedIntegerExpr.value))
									DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
																
								// now bring back the index
								
								if(unsignedIntegerExpr.value >= nodes.length) nodes.length = 0;
								else
								{
									domChild = nodes[unsignedIntegerExpr.value];
									nodes.length = 0;
									nodes[0] = domChild;
								}
							}
							else if(attribExpr.attribute is DOMPathNameExpression)
							{
								nameExpr = attribExpr.attribute as DOMPathNameExpression;
								if(null == nameExpr) 
									DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
								
								domChildren = filterByAttribute(elements, nameExpr);
								
								total = domChildren.length;
								for(i = 0; i < total; i++)
								{
									domChild = domChildren[i];
									if(nodes.indexOf(domChild) == -1) nodes.push(domChild);
								}	
							}
							else DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
						}
						else if(expression is DOMPathNameExpression)
						{
							domChildren = filterByAttribute(elements, expression);
							
							total = domChildren.length;
							for(i = 0; i < total; i++)
							{
								domChild = domChildren[i];
								if(nodes.indexOf(domChild) == -1) nodes.push(domChild);
							}	
						}
						else DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
						
						domChild = null;
						domChildren = null;
						domElements = null;
							
						// we've finished the expression tree
						valid = false;
						
						break;
						
					case DOMPathExpressionType.NAME:
					
						domChildren = filterByName(elements, expression);
						
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
					
					case DOMPathExpressionType.INDEX_ACCESS:
					
						// move to the next expression
						indexAccessExpr = expression as DOMPathIndexAccessExpression;
						if (null == indexAccessExpr)
							DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
						
						domElements = elements.concat();
						elements.length = 0;
						
						// check that the name is valid
						if(indexAccessExpr.name is DOMPathNameExpression)
						{
							nameExpr = indexAccessExpr.name as DOMPathNameExpression;
														
							// actually filter the name.
							domChildren = filterByName(domElements, nameExpr);
						}
						else if(indexAccessExpr.name is DOMPathWildcardExpression)
						{
							domChildren = filterByWildcard(domElements);
						}
						else DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
						
						// check that the internal part is a unsigned integer.
						unsignedIntegerExpr = indexAccessExpr.parameter as 
																DOMPathUnsignedIntegerExpression;
																
						if (null == unsignedIntegerExpr)
							DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
						if(isNaN(unsignedIntegerExpr.value))
							DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
						
						total = domChildren.length;
						for(i = 0; i < total; i++)
						{
							domChild = domChildren[i];
							if(nodes.indexOf(domChild) == -1) nodes.push(domChild);
						}
						
						// now bring back the index
						domChild = nodes[unsignedIntegerExpr.value];
						nodes.length = 0;
						nodes[0] = domChild;
						
						// reset everything
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
							domChildren = getAllDOMElementChildren(domElement);
							if (domChildren.length > 0) elements = elements.concat(domChildren);
						}
						
						domElement = null;
						domChildren = null;
						
						// move to the next expression
						const allDescendantsExpr : DOMPathDescendantsExpression = expression 
																	as DOMPathDescendantsExpression;
						if (null == allDescendantsExpr)
							DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
						expression = allDescendantsExpr.descendants;
						break;
					
					case DOMPathExpressionType.DESCENDANTS:
					
						// clone the current items, we're going remove them on the next pass
						domElements = elements.concat();
						elements.length = 0;
						
						elements = filterDescendants(domElements);
						
						domElements = null;
						
						// move to the next expression
						const descendantsExpr : DOMPathDescendantsExpression = expression 
																	as DOMPathDescendantsExpression;
						if (null == descendantsExpr)
							DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
						expression = descendantsExpr.descendants;
						break;
					
					case DOMPathExpressionType.NAME_DESCENDANTS:
					
						filterDescExpr = expression as DOMPathNameDescendantsExpression;
						if (null == filterDescExpr)
							DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
						
						// filter name	
						domElements = elements.concat();
						elements.length = 0;
						
						if(filterDescExpr.name is DOMPathNameExpression)
						{
							nameExpr = filterDescExpr.name as DOMPathNameExpression;
							domChildren = filterByName(domElements, nameExpr);
						}
						else if(filterDescExpr.name is DOMPathWildcardExpression)
						{
							domChildren = filterByWildcard(domElements);
						}
						else if(filterDescExpr.name is DOMPathIndexAccessExpression)
						{
							indexAccessExpr = filterDescExpr.name as 
																DOMPathIndexAccessExpression;
							
							nameExpr = indexAccessExpr.name as DOMPathNameExpression;
							domChildren = filterByName(domElements, nameExpr);	
						}
						else DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
						
						total = domChildren.length;
						for(i = 0; i < total; i++)
						{
							domChild = domChildren[i];
							if(elements.indexOf(domChild) == -1) elements.push(domChild);
						}
						
						// filter children
						domElements = elements.concat();
						elements.length = 0;
						
						elements = filterDescendants(domElements);
						
						domChild = null;
						domChildren = null;
						domElements = null;
						
						// move to the next expression
						expression = filterDescExpr.descendants;
						break;
					
					case DOMPathExpressionType.ATTRIBUTE_DESCENDANTS:
					
						const attribDescExpr : DOMPathAttributeDescendantsExpression = 
												expression as DOMPathAttributeDescendantsExpression;
												
						if (null == attribDescExpr)
							DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
						
						// filter name	
						domElements = elements.concat();
						elements.length = 0;
						
						if(attribDescExpr.name is DOMPathNameExpression)
						{
							nameExpr = attribDescExpr.name as DOMPathNameExpression;
							domChildren = filterByName(domElements, nameExpr);
						}
						else DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
						
						// we have a index expression here
						if(attribDescExpr.attributeName is DOMPathIndexAccessExpression)
						{
							indexAccessExpr = attribDescExpr.attributeName as 
																	DOMPathIndexAccessExpression;
							nameExpr = indexAccessExpr.name as DOMPathNameExpression;
							
							// now filter by attributes
							domChildren = filterNodesByAttribute(	domChildren, 
																		nameExpr
																		);
							total = domChildren.length;
							for(i = 0; i < total; i++)
							{
								domChild = domChildren[i];
								if(nodes.indexOf(domChild) == -1) nodes.push(domChild);
							}
							
							// check that the internal part is a unsigned integer.
							unsignedIntegerExpr = indexAccessExpr.parameter as 
																DOMPathUnsignedIntegerExpression;
																	
							if (null == unsignedIntegerExpr)
								DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
							if(isNaN(unsignedIntegerExpr.value))
								DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
								
							// now bring back the index
							if(unsignedIntegerExpr.value >= nodes.length) nodes.length = 0;
							else
							{
								domChild = nodes[unsignedIntegerExpr.value];
								nodes.length = 0;
								nodes[0] = domChild;
							}											
						}
						else if(attribDescExpr.attributeName is DOMPathNameExpression)
						{
							// now filter by attributes
							domChildren = filterNodesByAttribute(	domChildren, 
																		attribDescExpr.attributeName
																		);
							total = domChildren.length;
							for(i = 0; i < total; i++)
							{
								domChild = domChildren[i];
								if(nodes.indexOf(domChild) == -1) nodes.push(domChild);
							}											
						}
						else if(attribDescExpr.attributeName is DOMPathNameDescendantsExpression)
						{
							// now filter on the child attributes
							filterDescExpr = attribDescExpr.attributeName as 
																DOMPathNameDescendantsExpression;
																
							// this is the index access node
							indexAccessExpr = filterDescExpr.name as DOMPathIndexAccessExpression;																
							if(null == indexAccessExpr)
								DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
							
							nameExpr = indexAccessExpr.name as DOMPathNameExpression;
							
							// now filter by attributes
							domChildren = filterDescendantsByAttribute(	domChildren, 
																		nameExpr
																		);
							
							total = domChildren.length;
							for(i = 0; i < total; i++)
							{
								domChild = domChildren[i];
								if(elements.indexOf(domChild) == -1) elements.push(domChild);
							}
							
							// check that the internal part is a unsigned integer.
							unsignedIntegerExpr = indexAccessExpr.parameter as 
																DOMPathUnsignedIntegerExpression;
																	
							if (null == unsignedIntegerExpr)
								DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
							if(isNaN(unsignedIntegerExpr.value))
								DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
								
							// now bring back the index
							if(unsignedIntegerExpr.value >= elements.length) elements.length = 0;
							else 
							{
								domElement = elements[unsignedIntegerExpr.value];
								elements.length = 0;
								elements[0] = domElement;
							}
							
							domChild = null;
							domElement = null;
							domChildren = null;
							
							// this is the next node parse it.
							expression = filterDescExpr.descendants;
							break;
						}
						else DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
												
						domChild = null;
						domChildren = null;
						
						valid = false;
						break;
					
					default:
						DOMPathError.throwError(DOMPathError.INVALID_EXPRESSION);
						break;
				}
			}

			return nodes;
		}
		
		/**
		 * @private
		 */
		private function filterDescendants(elements : Vector.<IDOMElement>) : Vector.<IDOMElement>
		{
			var children : Vector.<IDOMElement> = new Vector.<IDOMElement>();
			
			const total : int = elements.length;
			for (var i : int = 0; i < total; i++)
			{
				const domElement : IDOMElement = elements[i];
				const domChildren : Vector.<IDOMNode> = getDOMElementChildren(domElement);
				if (domChildren.length > 0) children = children.concat(domChildren);
			}
			
			return children;
		}
		
		/**
		 * @private
		 */
		private function filterByWildcard(elements : Vector.<IDOMElement>) : Vector.<IDOMNode>
		{
			const domChildren : Vector.<IDOMNode> = new Vector.<IDOMNode>();
						
			const total : int = elements.length;
			for (var i : int = 0; i < total; i++)
			{
				const domElement : IDOMElement = elements[i];
				if(domElement is IDOMNode)
				{
					if(domChildren.indexOf(domElement) == -1) 
						domChildren.push(domElement);
				}
				else DOMPathError.throwError(DOMPathError.INVALID_ELEMENT);
			}
			
			return domChildren;
		}
		
		/**
		 * @private
		 */
		private function filterByAttribute(	elements : Vector.<IDOMElement>, 
											expression : IDOMPathExpression
											) :  Vector.<IDOMNode>
		{
			var nameExpr : DOMPathNameExpression;
			if(expression is DOMPathNameExpression)
			{
				nameExpr = expression as DOMPathNameExpression;
			}
			else if(expression is DOMPathAttributeExpression)
			{
				// filter the elements by the name
				const attrExpr : DOMPathAttributeExpression = expression as DOMPathAttributeExpression;
														
				nameExpr = attrExpr.attribute as DOMPathNameExpression;
				if (null == nameExpr) DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
			}
			else DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
			
			const total : int = elements.length;
			const domChildren : Vector.<IDOMNode> = new Vector.<IDOMNode>();
			for(var i : int = 0; i < total; i++)
			{
				const domElement : IDOMElement = elements[i];
				if(domElement is IDOMNode)
				{
					const domChild : IDOMNode = IDOMNode(domElement);
					if(nameExpr.name in domChild) domChildren.push(domChild);
				}
				else DOMPathError.throwError(DOMPathError.INVALID_ELEMENT);
			}
			
			return domChildren;
		}
		
		/**
		 * @private
		 */
		private function filterNodesByAttribute(	nodes : Vector.<IDOMNode>, 
													expression : IDOMPathExpression
													) :  Vector.<IDOMNode>
		{
			// filter the elements by the name
			const nameExpr : DOMPathNameExpression = expression as DOMPathNameExpression;
			if(null == nameExpr) DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION); 
				
			const total : int = nodes.length;
			const domChildren : Vector.<IDOMNode> = new Vector.<IDOMNode>();
			for(var i : int = 0; i < total; i++)
			{
				const domElement : IDOMElement = nodes[i];
				if(domElement is IDOMNode)
				{
					const domChild : IDOMNode = IDOMNode(domElement);
					if(nameExpr.name in domChild) domChildren.push(domChild);
				}
				else DOMPathError.throwError(DOMPathError.INVALID_ELEMENT);
			}
			
			return domChildren;
		}
		
		/**
		 * @private
		 */
		private function filterDescendantsByAttribute(	nodes : Vector.<IDOMNode>, 
														expression : IDOMPathExpression
														) :  Vector.<IDOMNode>
		{
			// filter the elements by the name
			const nameExpr : DOMPathNameExpression = expression as DOMPathNameExpression;
			if(null == nameExpr) DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
			
			var i : int;
			var total : int = nodes.length;
			var domElement : IDOMElement;
			var elements : Vector.<IDOMNode> = new Vector.<IDOMNode>();
			
			for (i = 0; i < total; i++)
			{
				domElement = nodes[i];
				const domElements : Vector.<IDOMNode> = getDOMElementChildren(domElement);
				if (domElements.length > 0) elements = elements.concat(domElements);
			}
			
			const domChildren : Vector.<IDOMNode> = new Vector.<IDOMNode>();
			
			total = elements.length;
			for(i = 0; i < total; i++)
			{
				domElement = elements[i];
				if(domElement is IDOMNode)
				{
					const domChild : IDOMNode = IDOMNode(domElement);
					if(nameExpr.name in domChild) domChildren.push(domChild);
				}
				else DOMPathError.throwError(DOMPathError.INVALID_ELEMENT);
			}
			
			return domChildren;
		}
		
		/**
		 * @private
		 */
		private function filterByName(	elements : Vector.<IDOMElement>, 
										expression : IDOMPathExpression
										) :  Vector.<IDOMNode>
		{
			// filter the elements by the name
			const nameExpr : DOMPathNameExpression = expression as DOMPathNameExpression;
			if (null == nameExpr) DOMPathError.throwError(DOMPathError.INVALID_EXPRESSION);
				
			const total : int = elements.length;
			const domChildren : Vector.<IDOMNode> = new Vector.<IDOMNode>();
			for(var i : int = 0; i < total; i++)
			{
				const domElement : IDOMElement = elements[i];
				if(domElement is IDOMNode)
				{
					const domChild : IDOMNode = IDOMNode(domElement);
					if(domChild.name == nameExpr.name) domChildren.push(domChild);
				}
				else DOMPathError.throwError(DOMPathError.INVALID_ELEMENT);
			}
			
			return domChildren;
		}
	}
}
