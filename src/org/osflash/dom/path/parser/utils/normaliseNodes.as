package org.osflash.dom.path.parser.utils
{
	import org.osflash.dom.element.IDOMNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function normaliseNodes(nodes : Vector.<Vector.<IDOMNode>>) : Vector.<IDOMNode>
	{
		const result : Vector.<IDOMNode> = new Vector.<IDOMNode>();
		
		const numNodes : int = nodes.length;
		for(var i : int = 0; i<numNodes; i++)
		{
			const domNodes : Vector.<IDOMNode> = nodes[i];
			const numDomNodes : int = domNodes.length;
			for(var j : int = 0; j<numDomNodes; j++)
			{
				const domNode : IDOMNode = domNodes[j];
				
				if(result.indexOf(domNode) == -1)
					result.push(domNode);
			}
		}
		
		return result;
	}
}
