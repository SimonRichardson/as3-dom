package org.osflash.dom.path.parser.utils
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.path.DOMPathError;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function filterByAttributeResults(	nodes : Vector.<IDOMNode>, 
												attribResults : Array
												) : Vector.<IDOMNode>
	{
		if(nodes.length != attribResults.length)
			DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
		
		const results : Vector.<IDOMNode> = new Vector.<IDOMNode>();
		
		const total : int = nodes.length;
		for(var i : int = 0; i<total; i++)
		{
			const node : IDOMNode = nodes[i];
			if(null != attribResults[i])
			{
				if (results.indexOf(node) == -1)
					results.push(node);
			}
		}
		
		return results;
	}
}
