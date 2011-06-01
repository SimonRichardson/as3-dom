package org.osflash.dom.path.parser.utils
{
	import org.osflash.dom.element.IDOMNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function callAttribute(domNodes : Vector.<IDOMNode>, attributeName : String) : Array
	{
		const results : Array = [];
		
		const total : int = domNodes.length;
		for(var i : int = 0; i < total; i++)
		{
			const domNode : IDOMNode = domNodes[i];
			if(attributeName in domNode)
			{
				results.push(domNode[attributeName]);
			}
			else results.push(null);
		}
		
		return results;
		
	}
}
