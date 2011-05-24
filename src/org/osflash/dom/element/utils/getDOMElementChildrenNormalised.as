package org.osflash.dom.element.utils
{
	import org.osflash.dom.dom_namespace;
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function getDOMElementChildrenNormalised(element : IDOMElement) : Vector.<IDOMNode>
	{
		var result : Vector.<IDOMNode> = new Vector.<IDOMNode>();
		if (element.numChildren > 0)
		{
			const nodes : Vector.<IDOMNode> = element.dom_namespace::children;
			const total : int = nodes.length;
			for (var i : int = 0; i < total; i++)
			{
				const node : IDOMNode = nodes[i];
				const children : Vector.<IDOMNode> = getDOMElementChildrenNormalised(node);
				if(children.length > 0) result = result.concat(children);
			}
			result = result.concat(nodes);
		}
		return result;
	}
}
