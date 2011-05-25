package org.osflash.dom.element.utils
{
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.dom_namespace;
	import org.osflash.dom.element.DOMElement;
	import org.osflash.dom.element.IDOMNode;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function getDOMElementChildren(element : IDOMElement) : Vector.<IDOMNode>
	{
		// TODO : Make sure that we only add items that exist once i.e. no duplications
		
		var result : Vector.<IDOMNode> = new Vector.<IDOMNode>();
		if (element.numChildren > 0)
		{
			const domElement : DOMElement = element as DOMElement;
			if (null == domElement)
			{
				const total : int = element.numChildren;
				for(var i : int = 0; i<total; i++)
				{
					const node : IDOMNode = element.getAt(i);
					result.push(node);
				}
			}
			else
			{
				const nodes : Vector.<IDOMNode> = domElement.dom_namespace::children;
				result = result.concat(nodes);
			}
		}
		return result;
	}
}
