package org.osflash.dom.path
{
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.path.parser.expressions.DOMPathCallMethodExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathDescendantsExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.expressions.DOMPathIndexAccessDescendantsExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathNameExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathUnsignedIntegerExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathDescendantsExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathLeftRightNodeExpression;
	import org.osflash.dom.path.parser.stream.DOMPathByteArrayOutputStream;
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	import org.osflash.dom.path.parser.utils.callAttribute;
	import org.osflash.dom.path.parser.utils.callMethodNameWithArgs;
	import org.osflash.dom.path.parser.utils.filterAtIndexAccess;
	import org.osflash.dom.path.parser.utils.filterByAttributeResults;
	import org.osflash.dom.path.parser.utils.filterByName;
	import org.osflash.dom.path.parser.utils.getContextChildren;
	import org.osflash.dom.path.parser.utils.getDocumentChildren;

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
				case DOMPathExpressionType.ATTRIBUTE:
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
			const stream : IDOMPathOutputStream = new DOMPathByteArrayOutputStream();
			_expression.describe(stream);
			stream.position = 0;
			log("Expression >", stream.toString());
			
			// Parsing the expressions.
			var results : Array;
			var nameExpr : DOMPathNameExpression;
			var unsignedExpr : DOMPathUnsignedIntegerExpression;
			var callMethodExpr : DOMPathCallMethodExpression;
			
			var validExpression : Boolean = true;
			while(validExpression)
			{
				_context.pushContext(expression);
				
				log(">", 	_context.length, 
							expression, 
							DOMPathExpressionType.getType(expression.type.type)
							);
				
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
					
					case DOMPathExpressionType.ATTRIBUTE:
						leftRightExpr = IDOMPathLeftRightNodeExpression(expression);
						nameExpr = DOMPathNameExpression(leftRightExpr.left);
						
						domNodes = filterByName(domNodes, nameExpr);
						
						nameExpr = DOMPathNameExpression(leftRightExpr.right);
						results = callAttribute(domNodes, nameExpr.name);
						
						// This removes nodes with invalid results
						domNodes = filterByAttributeResults(domNodes, results);
						
						resultNodes = domNodes;
						validExpression = false;
						break;
					
					case DOMPathExpressionType.INSTANCE:
						leftRightExpr = IDOMPathLeftRightNodeExpression(expression);
						nameExpr = DOMPathNameExpression(leftRightExpr.left);
						
						domNodes = filterByName(domNodes, nameExpr);
						
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
					
					default:
						DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
						break;
				}
			}
			
			return resultNodes;
		}
	}
}
