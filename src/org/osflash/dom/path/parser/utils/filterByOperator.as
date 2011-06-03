package org.osflash.dom.path.parser.utils
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.path.DOMPathError;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathBooleanExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathIntegerExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathNameExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathNullExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathNumberExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathStringExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathUnsignedIntegerExpression;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function filterByOperator(	operator : DOMPathExpressionType,
										nodes : Vector.<IDOMNode>,
										name : DOMPathNameExpression,
										value : IDOMPathExpression
										) : Vector.<IDOMNode>
	{
		const results : Vector.<IDOMNode> = new Vector.<IDOMNode>();
		
		// I hate to leave this a wildcard
		var raw : *;
		if(value.type == DOMPathExpressionType.INTEGER)
			raw = DOMPathIntegerExpression(value).value;
		else if(value.type == DOMPathExpressionType.UNSIGNED_INTEGER)
			raw = DOMPathUnsignedIntegerExpression(value).value;
		else if(value.type == DOMPathExpressionType.NUMBER)
			raw = DOMPathNumberExpression(value).value;
		else if(value.type == DOMPathExpressionType.STRING)
			raw = DOMPathStringExpression(value).value;
		else if(value.type == DOMPathExpressionType.BOOLEAN)
			raw = DOMPathBooleanExpression(value).value;
		else if(value.type == DOMPathExpressionType.NULL)
			raw = DOMPathNullExpression(value).value;
		else 
			DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
		
		// Is valid item
		var valid : Boolean = false;
		
		// Shortcut to help for a faster lookup time
		const attribute : String = name.name;
		
		const total : int = nodes.length;
		for(var i : int = 0; i<total; i++)
		{
			valid = false;
			
			const node : IDOMNode = nodes[i];
			if(attribute in node)
			{
				if(operator == DOMPathExpressionType.EQUALITY)
					valid = node[attribute] == raw;
				else if(operator == DOMPathExpressionType.INEQUALITY)
					valid = node[attribute] != raw;
				else if(operator == DOMPathExpressionType.LESS_THAN)
					valid = node[attribute] < raw;
				else if(operator == DOMPathExpressionType.LESS_THAN_OR_EQUAL_TO)
					valid = node[attribute] <= raw;
				else if(operator == DOMPathExpressionType.GREATER_THAN)
					valid = node[attribute] > raw;
				else if(operator == DOMPathExpressionType.GREATER_THAN_OR_EQUAL_TO)
					valid = node[attribute] >= raw;
				else 
					DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
				
				if (valid && results.indexOf(node) == -1)
					results.push(node);
			}
		}
		
		return results;
	}
}
