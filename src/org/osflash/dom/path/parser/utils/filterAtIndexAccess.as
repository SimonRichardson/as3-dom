package org.osflash.dom.path.parser.utils
{
	import org.osflash.dom.element.IDOMNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function filterAtIndexAccess(	domNodes : Vector.<IDOMNode>, 
											index: uint
											) : Vector.<IDOMNode>
	{
		if(index < domNodes.length)
		{
			const domNode : IDOMNode = domNodes[index];
						
			domNodes.length = 0;
			domNodes[0] = domNode;
		}
		else domNodes.length = 0;
		
		return domNodes;
	}
}
