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
	public function filterByInequality(	nodes : Vector.<IDOMNode>,
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
		
		const attribute : String = name.name;
		
		const total : int = nodes.length;
		for(var i : int = 0; i<total; i++)
		{
			const node : IDOMNode = nodes[i];
			if(attribute in node && node[attribute] != raw)
			{
				if (results.indexOf(node) == -1)
					results.push(node);
			}
		}
		
		return results;
	}
}
