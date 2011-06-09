package org.osflash.dom.path.parser.utils
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.element.utils.getDOMElementChildren;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public function getContextChildren(nodes : Vector.<IDOMNode>) : Vector.<IDOMNode>
	{
		const results : Vector.<IDOMNode> = new Vector.<IDOMNode>();

		const total : int = nodes.length;
		for (var i : int = 0; i < total; i++)
		{
			const node : IDOMNode = nodes[i];

			const children : Vector.<IDOMNode> = getDOMElementChildren(node);
			const numChildren : int = children.length;
			for (var j : int = 0; j < numChildren; j++)
			{
				const child : IDOMNode = children[j];
				if (results.indexOf(child) == -1)
					results.push(child);
			}
		}

		return results;
	}
}
