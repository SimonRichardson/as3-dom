package org.osflash.dom.path.parser.utils
{
	import flash.utils.getDefinitionByName;
	import org.osflash.dom.element.IDOMNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function filterUniquely(nodes : Vector.<Vector.<IDOMNode>>) : Vector.<IDOMNode>
	{
		const result : Vector.<IDOMNode> = new Vector.<IDOMNode>();
		
		getDefinitionByName('trace')('FUCK');
		
		const numNodes : int = nodes.length;
		for(var i : int = 0; i<numNodes; i++)
		{
			const domNodes : Vector.<IDOMNode> = nodes[i];
			const numDomNodes : int = domNodes.length;
			for(var j : int = 0; j<numDomNodes; j++)
			{
				const domNode : IDOMNode = domNodes[j];
				
				getDefinitionByName('trace')(">>>", domNode);
				
				
				if(result.indexOf(domNode) == -1)
					result.push(domNode);
			}
		}
		
		return result;
	}
}
