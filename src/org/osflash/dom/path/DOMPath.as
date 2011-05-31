package org.osflash.dom.path
{
	import org.osflash.dom.path.parser.expressions.DOMPathDescendantsExpression;
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.expressions.DOMPathNameExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathDescendantsExpression;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.stream.DOMPathByteArrayOutputStream;
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
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
			var resultNodes : Vector.<IDOMNode> = new Vector.<IDOMNode>();
			var domNodes : Vector.<IDOMNode> = Vector.<IDOMNode>([element]);
			
			var expression : IDOMPathExpression = _expression;
			
			var injectedType : int;
			switch(expression.type)
			{
				case DOMPathExpressionType.WILDCARD:
					injectedType = DOMPathDescendantsExpression.ALL;
					expression = new DOMPathDescendantsExpression(injectedType, expression);
					break;
				case DOMPathExpressionType.NAME:
				case DOMPathExpressionType.NAME_DESCENDANTS:
					injectedType = DOMPathDescendantsExpression.CONTEXT;
					expression = new DOMPathDescendantsExpression(injectedType, expression);
					break;
			}
			
			const stream : IDOMPathOutputStream = new DOMPathByteArrayOutputStream();
			_expression.describe(stream);
			stream.position = 0;
			log("Expression >", stream.toString());
			
			var nameExpr : DOMPathNameExpression;
			var descInterface : IDOMPathDescendantsExpression;
			
			var validExpression : Boolean = true;
			while(validExpression)
			{
				log(">", expression, DOMPathExpressionType.getType(expression.type.type));
				
				switch(expression.type)
				{
					case DOMPathExpressionType.WILDCARD:
						resultNodes = domNodes;
						
						validExpression = false;
						break;
					case DOMPathExpressionType.NAME:
						nameExpr = DOMPathNameExpression(expression);
						resultNodes = filterByName(domNodes, nameExpr);
						
						validExpression = false;
						break;
					case DOMPathExpressionType.DESCENDANTS:
					case DOMPathExpressionType.NAME_DESCENDANTS:
						domNodes = getContextChildren(domNodes);
						
						descInterface = IDOMPathDescendantsExpression(expression);
						expression = descInterface.descendants;
						break;
					case DOMPathExpressionType.ALL_DESCENDANTS:
						domNodes = getDocumentChildren(domNodes);
						
						descInterface = IDOMPathDescendantsExpression(expression);
						expression = descInterface.descendants;
						break;
				}
			}
			
			return resultNodes;
		}
	}
}
