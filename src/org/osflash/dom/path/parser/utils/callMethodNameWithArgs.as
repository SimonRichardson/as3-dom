package org.osflash.dom.path.parser.utils
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.path.DOMPathError;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathBooleanExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathIntegerExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathNullExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathNumberExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathStringExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathUnsignedIntegerExpression;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function callMethodNameWithArgs(	domNodes : Vector.<IDOMNode>, 
											methodName : String, 
											parameters : Vector.<IDOMPathExpression>
											) : Array
	{
		const args : Array = [];
		const argsLength : int = parameters.length;
		
		var i : int;
		
		for(i = 0; i < argsLength; i++)
		{
			const paramExpr : IDOMPathExpression = parameters[i];

			if(paramExpr.type == DOMPathExpressionType.INTEGER)
				args.push(DOMPathIntegerExpression(paramExpr).value);
			else if(paramExpr.type == DOMPathExpressionType.UNSIGNED_INTEGER)
				args.push(DOMPathUnsignedIntegerExpression(paramExpr).value);
			else if(paramExpr.type == DOMPathExpressionType.NUMBER)
				args.push(DOMPathNumberExpression(paramExpr).value);
			else if(paramExpr.type == DOMPathExpressionType.STRING)
				args.push(DOMPathStringExpression(paramExpr).value);
			else if(paramExpr.type == DOMPathExpressionType.BOOLEAN)
				args.push(DOMPathBooleanExpression(paramExpr).value);
			else if(paramExpr.type == DOMPathExpressionType.NULL)
				args.push(DOMPathNullExpression(paramExpr).value);
			else 
				DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
		}
		
		const results : Array = [];
		
		const total : int = domNodes.length;
		for(i = 0; i < total; i++)
		{
			const domNode : IDOMNode = domNodes[i];
			
			if(methodName in domNode)
			{
				const method : Function = domNode[methodName];
				if(argsLength == 0) results.push(method());
				else if(argsLength == 1) results.push(method(args[0]));
				else if(argsLength == 2) results.push(method(args[0], args[1]));
				else if(argsLength == 3) results.push(method(args[0], args[1], args[2]));
				else results.push(method.apply(null, args));
			}
			else results.push(null);
		}
		
		return results;
	}
}
