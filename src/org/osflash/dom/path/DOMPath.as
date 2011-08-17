package org.osflash.dom.path
{
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.expressions.IDOMPathDescendantsExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathLeftRightNodeExpression;
	import org.osflash.dom.path.parser.expressions.accessors.DOMPathDescendantsExpression;
	import org.osflash.dom.path.parser.expressions.accessors.DOMPathIndexAccessDescendantsExpression;
	import org.osflash.dom.path.parser.expressions.accessors.DOMPathIndexAccessExpression;
	import org.osflash.dom.path.parser.expressions.accessors.DOMPathNameDescendantsExpression;
	import org.osflash.dom.path.parser.expressions.instances.DOMPathCallMethodExpression;
	import org.osflash.dom.path.parser.expressions.instances.DOMPathGroupExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathNameExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathUnsignedIntegerExpression;
	import org.osflash.dom.path.parser.utils.callAttribute;
	import org.osflash.dom.path.parser.utils.callMethodNameWithArgs;
	import org.osflash.dom.path.parser.utils.filterAtIndexAccess;
	import org.osflash.dom.path.parser.utils.filterByAttributeResults;
	import org.osflash.dom.path.parser.utils.filterByName;
	import org.osflash.dom.path.parser.utils.filterByOperator;
	import org.osflash.dom.path.parser.utils.getContextChildren;
	import org.osflash.dom.path.parser.utils.getDocumentChildren;
	import org.osflash.dom.path.parser.utils.normaliseNodes;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPath implements IDOMPath
	{

		/**
		 * @private
		 */
		private var _expression : IDOMPathExpression;
		
		private var _context : DOMPathContext;

		public function DOMPath(expression : IDOMPathExpression)
		{
			if (null == expression) throw new ArgumentError('Given value can not be null');

			_expression = expression;
			
			_context = new DOMPathContext();
		}

		/**
		 * @inheritDoc
		 */
		public function execute(element : IDOMElement) : Vector.<IDOMNode>
		{
			var resultNodes : Vector.<IDOMNode> = new Vector.<IDOMNode>();
			var domNodes : Vector.<IDOMNode> = Vector.<IDOMNode>([element]);
			
			var expression : IDOMPathExpression = _expression;
			
			var descExpr : IDOMPathDescendantsExpression;
			var leftRightExpr : IDOMPathLeftRightNodeExpression;
			
			// TODO : Should we inject the context into none context syntax.
			var injectedType : int;
			switch(expression.type)
			{
				case DOMPathExpressionType.WILDCARD:
					injectedType = DOMPathDescendantsExpression.ALL;
					expression = new DOMPathDescendantsExpression(injectedType, expression);
					break;
				case DOMPathExpressionType.NAME:
				case DOMPathExpressionType.INFIX_ATTRIBUTE:
					injectedType = DOMPathDescendantsExpression.CONTEXT;
					expression = new DOMPathDescendantsExpression(injectedType, expression);
					break;
				case DOMPathExpressionType.NAME_DESCENDANTS:
				case DOMPathExpressionType.INDEX_ACCESS:
				case DOMPathExpressionType.INSTANCE:
					leftRightExpr = IDOMPathLeftRightNodeExpression(expression);
					if(leftRightExpr.left.type == DOMPathExpressionType.WILDCARD)
						injectedType = DOMPathDescendantsExpression.ALL;
					else
						injectedType = DOMPathDescendantsExpression.CONTEXT;
					expression = new DOMPathDescendantsExpression(injectedType, expression);
					break;
			}
			
			// TODO : Remove this
			// const stream : IStreamOutput = new StreamByteArrayOutput();
			// _expression.describe(stream);
			// stream.position = 0;
			
			// Parsing the expressions.
			var results : Array;
			var expressions : Vector.<IDOMPathExpression>;
			
			// Commonly used expression / variables.
			var exprType : DOMPathExpressionType;
			var nameExpr : DOMPathNameExpression;
			var groupExpr : DOMPathGroupExpression;
			var nameDescExpr : DOMPathNameDescendantsExpression;
			var unsignedExpr : DOMPathUnsignedIntegerExpression;
			var callMethodExpr : DOMPathCallMethodExpression;
			
			var validExpression : Boolean = true;
			while(validExpression)
			{
				_context.pushContext(expression, domNodes);
				
				/*
				info(">", 	_context.length, 
							expression, 
							DOMPathExpressionType.getType(expression.type.type)
							);
				 */
				
				switch(expression.type)
				{
					case DOMPathExpressionType.WILDCARD:
						resultNodes = domNodes;
						validExpression = false;
						break;
						
					case DOMPathExpressionType.NAME:
						nameExpr = DOMPathNameExpression(expression);
						domNodes = filterByName(domNodes, nameExpr);
						
						resultNodes = domNodes;
						validExpression = false;
						break;
						
					case DOMPathExpressionType.CALL_METHOD:
						callMethodExpr = DOMPathCallMethodExpression(expression);
						nameExpr = DOMPathNameExpression(callMethodExpr.method);
						
						results = callMethodNameWithArgs(	domNodes,
															nameExpr.name,
															callMethodExpr.parameters
															);
															
						resultNodes = domNodes;
						validExpression = false;
						break;
						
					case DOMPathExpressionType.INDEX_ACCESS:
						leftRightExpr = IDOMPathLeftRightNodeExpression(expression);
						
						if(leftRightExpr.left.type == DOMPathExpressionType.NAME)
						{
							nameExpr = DOMPathNameExpression(leftRightExpr.left);
							domNodes = filterByName(domNodes, nameExpr);
						}
						else if(leftRightExpr.left.type == DOMPathExpressionType.WILDCARD)
						{
							// This is so we can have select all for wildcards.
							if(_context.match(DOMPathExpressionType.DESCENDANTS))
								domNodes = getContextChildren(domNodes);
						}
						else DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
						
						unsignedExpr = DOMPathUnsignedIntegerExpression(leftRightExpr.right);
						domNodes = filterAtIndexAccess(domNodes, unsignedExpr.value);
						
						resultNodes = domNodes;
						validExpression = false;
						break;
					
					case DOMPathExpressionType.INFIX_ATTRIBUTE:
						leftRightExpr = IDOMPathLeftRightNodeExpression(expression);
						nameExpr = DOMPathNameExpression(leftRightExpr.left);
						
						domNodes = filterByName(domNodes, nameExpr);
						
						if(leftRightExpr.right.type == DOMPathExpressionType.NAME)
						{
							nameExpr = DOMPathNameExpression(leftRightExpr.right);
						}
						else if(leftRightExpr.right.type == DOMPathExpressionType.INDEX_ACCESS)
						{
							leftRightExpr = IDOMPathLeftRightNodeExpression(leftRightExpr.right);
							nameExpr = DOMPathNameExpression(leftRightExpr.left);
						}
						else if(leftRightExpr.right.type == DOMPathExpressionType.NAME_DESCENDANTS)
						{
							nameDescExpr = DOMPathNameDescendantsExpression(leftRightExpr.right);
							leftRightExpr = IDOMPathLeftRightNodeExpression(nameDescExpr.left);
							
							nameExpr = DOMPathNameExpression(leftRightExpr.left);
						}
						else DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
						
						results = callAttribute(domNodes, nameExpr.name);
						
						// This removes nodes with invalid results
						domNodes = filterByAttributeResults(domNodes, results);
						
						// Filter by index
						if(leftRightExpr is DOMPathIndexAccessExpression)
						{
							unsignedExpr = DOMPathUnsignedIntegerExpression(leftRightExpr.right);
							domNodes = filterAtIndexAccess(domNodes, unsignedExpr.value);
						}
						
						// Move on to the next expression
						if(null != nameDescExpr)
						{
							injectedType = DOMPathDescendantsExpression.CONTEXT;
							expression = new DOMPathDescendantsExpression(	injectedType, 
																			nameDescExpr.right
																			);
							break;
						}
																			
						resultNodes = domNodes;
						validExpression = false;
						break;
					
					case DOMPathExpressionType.INSTANCE:
						leftRightExpr = IDOMPathLeftRightNodeExpression(expression);
						if(leftRightExpr.left is DOMPathNameExpression)
						{
							nameExpr = DOMPathNameExpression(leftRightExpr.left);
							
							domNodes = filterByName(domNodes, nameExpr);
						}
												
						expression = leftRightExpr.right;
						break;
										
					case DOMPathExpressionType.DESCENDANTS:
						domNodes = getContextChildren(domNodes);
						
						descExpr = IDOMPathDescendantsExpression(expression);
						expression = descExpr.descendants;
						break;
						
					case DOMPathExpressionType.NAME_DESCENDANTS:
						descExpr = IDOMPathDescendantsExpression(expression);
					
						leftRightExpr = IDOMPathLeftRightNodeExpression(expression);
						if(leftRightExpr.left.type == DOMPathExpressionType.INDEX_ACCESS)
						{
							expression = new DOMPathIndexAccessDescendantsExpression(
																		leftRightExpr.left, 
																		descExpr.descendants
																		);
						}
						else
						{
							domNodes = getContextChildren(domNodes);
							
							expression = descExpr.descendants;
						}
						break;
					
					case DOMPathExpressionType.INDEX_ACCESS_DESCENDANTS:
						leftRightExpr = IDOMPathLeftRightNodeExpression(expression);
						leftRightExpr = IDOMPathLeftRightNodeExpression(leftRightExpr.left);
						
						nameExpr = DOMPathNameExpression(leftRightExpr.left);
						unsignedExpr = DOMPathUnsignedIntegerExpression(leftRightExpr.right);
						
						domNodes = filterByName(domNodes, nameExpr);
						domNodes = filterAtIndexAccess(domNodes, unsignedExpr.value);
						domNodes = getContextChildren(domNodes);
						
						descExpr = IDOMPathDescendantsExpression(expression);
						expression = descExpr.descendants;
						break;
					
					case DOMPathExpressionType.ALL_DESCENDANTS:
						domNodes = getDocumentChildren(domNodes);
						
						descExpr = IDOMPathDescendantsExpression(expression);
						expression = descExpr.descendants;
						break;
					
					case DOMPathExpressionType.GROUP:
						groupExpr = DOMPathGroupExpression(expression);
						
						expressions = groupExpr.expressions;
						
						var logicalPrevExprType : DOMPathExpressionType;
						var logicalDomNodes : Vector.<Vector.<IDOMNode>> = 
																new Vector.<Vector.<IDOMNode>>();
						var logicalOrDomNodes : Vector.<IDOMNode> = domNodes;
						
						var validSubExpression : Boolean = true;
						const total : int = expressions.length;
						for(var i : int = 0; i<total; i++)
						{
							expression = expressions[i];
							
							_context.pushContext(expression, domNodes);
							
							/*			
							info(">", 	_context.length, 
										expression, 
										DOMPathExpressionType.getType(expression.type.type)
										);
							 */
							
							var logicalExpr : IDOMPathLeftRightNodeExpression;
							switch(expression.type)
							{
								case DOMPathExpressionType.ATTRIBUTE:
									// Because of the way the parser works, this is a prefix and 
									// not infix like outside of a group expression
									break;
								case DOMPathExpressionType.EQUALITY:
								case DOMPathExpressionType.INEQUALITY:
								case DOMPathExpressionType.LESS_THAN:
								case DOMPathExpressionType.LESS_THAN_OR_EQUAL_TO:
								case DOMPathExpressionType.GREATER_THAN:
								case DOMPathExpressionType.GREATER_THAN_OR_EQUAL_TO:
									leftRightExpr = IDOMPathLeftRightNodeExpression(expression);
									nameExpr = DOMPathNameExpression(leftRightExpr.left);
									
									expression = leftRightExpr.right;
									
									logicalPrevExprType = exprType;
									
									exprType = leftRightExpr.right.type;
									if(	exprType == DOMPathExpressionType.LOGICAL_AND ||
										exprType == DOMPathExpressionType.LOGICAL_OR
										)
									{
										logicalExpr = IDOMPathLeftRightNodeExpression(
																				leftRightExpr.right
																				);
										expression = logicalExpr.left;
									}										
									
									const operator : DOMPathExpressionType = leftRightExpr.type;
									domNodes = filterByOperator(	operator,
																	domNodes, 
																	nameExpr, 
																	expression
																	);
									logicalDomNodes.push(domNodes);
									
									if(null != logicalExpr)
									{
										if(exprType == DOMPathExpressionType.LOGICAL_OR)
											domNodes = logicalOrDomNodes;
										
										if(logicalPrevExprType == DOMPathExpressionType.LOGICAL_OR)
											domNodes = normaliseNodes(logicalDomNodes);
										
										expression = logicalExpr.right;
										break;
									}
																		
									// Make sure we're only having the correct items here
									if(logicalPrevExprType == DOMPathExpressionType.LOGICAL_OR)
										domNodes = normaliseNodes(logicalDomNodes);
									
									logicalDomNodes.length = 0;
									
									validSubExpression = false;
									break;
								default:
									DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
									break;
							}
							
							logicalExpr = null;
							
							if(!validSubExpression)
								break;
						}
												
						resultNodes = domNodes;
						validExpression = false;
						break;
					
					default:
						DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
						break;
				}
				
				// TODO : Make sure we result all values here.
				nameExpr = null;
				groupExpr = null;
				nameDescExpr = null;
				unsignedExpr = null;
				callMethodExpr = null;
			}
			
			// Always make sure we return a unique set of nodes.
			return normaliseNodes(new <Vector.<IDOMNode>>[resultNodes]);
		}
	}
}
