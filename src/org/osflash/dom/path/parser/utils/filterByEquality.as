package org.osflash.dom.path.parser.utils
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.path.DOMPathError;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathIntegerExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathNameExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathNumberExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathStringExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathUnsignedIntegerExpression;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function filterByEquality(	nodes : Vector.<IDOMNode>,
										name : DOMPathNameExpression,
										value : IDOMPathExpression
										) : Vector.<IDOMNode>
	{
		const results : Vector.<IDOMNode> = new Vector.<IDOMNode>();
		
		// I hate to leave this a wildcard
		var raw : *;
		switch(value.type)
		{
			case DOMPathExpressionType.STRING:
				raw = DOMPathStringExpression(value).value;	
				break;
			case DOMPathExpressionType.INTEGER:
				raw = DOMPathIntegerExpression(value).value;
				break;
			case DOMPathExpressionType.UNSIGNED_INTEGER:
				raw = DOMPathUnsignedIntegerExpression(value).value;
				break;
			case DOMPathExpressionType.NUMBER:
				raw = DOMPathNumberExpression(value).value;
				break;
			default:
				DOMPathError.throwError(DOMPathError.UNEXPECTED_EXPRESSION);
		}
		
		const attribute : String = name.name;
		
		const total : int = nodes.length;
		for(var i : int = 0; i<total; i++)
		{
			const node : IDOMNode = nodes[i];
			if(attribute in node && node[attribute] == raw)
			{
				if (results.indexOf(node) == -1)
					results.push(node);
			}
		}
		
		return results;
	}
}
