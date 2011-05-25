package org.osflash.dom.element.utils
{
	import org.osflash.dom.dom_namespace;
	import org.osflash.dom.element.DOMElement;
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function getAllDOMElementChildren(element : IDOMElement) : Vector.<IDOMNode>
	{
		var result : Vector.<IDOMNode> = new Vector.<IDOMNode>();
		
		// TODO : Make sure that we only add items that exist once i.e. no duplications
		
		var i : int;
		var total : int;
		var node : IDOMNode;
		var children : Vector.<IDOMNode>;
		
		if (element.numChildren > 0)
		{
			const domElement : DOMElement = element as DOMElement;
			if(null == domElement)
			{
				// Try the slower method and go through the interface instead.
				total = element.numChildren;
				for(i = 0; i<total; i++)
				{
					node = element.getAt(i);
					result.push(node);
					
					children = getAllDOMElementChildren(node);
					if(children.length > 0) result = result.concat(children);
				}
			}
			else
			{
				// Try and go through the fast via namespace
				const nodes : Vector.<IDOMNode> = domElement.dom_namespace::children;
				total = nodes.length;
				for (i = 0; i < total; i++)
				{
					node = nodes[i];
					result.push(node);
					
					children = getAllDOMElementChildren(node);
					if(children.length > 0) result = result.concat(children);
				}
			}
		}
		
		return result;
	}
}
