package org.osflash.dom.path.parser.utils
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.path.parser.expressions.DOMPathNameExpression;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public function filterByName(	nodes : Vector.<IDOMNode>, 
									nameExpression : DOMPathNameExpression
									) : Vector.<IDOMNode>
	{
		const results : Vector.<IDOMNode> = new Vector.<IDOMNode>();
		
		const total : int = nodes.length;
		for(var i : int = 0; i<total; i++)
		{
			const node : IDOMNode = nodes[i];
			if(node.name == nameExpression.name)
			{
				if (results.indexOf(node) == -1)
					results.push(node);
			}
		}
		
		return results;
	}
}
