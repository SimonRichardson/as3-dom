package org.osflash.dom.element.utils
{
	import org.osflash.dom.element.DOMNode;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function cloneFromDisplayObjects(displayObject : DisplayObject) : DOMNode
	{
		const node : DOMNode = new DOMNode(displayObject.name);
		 
		if(displayObject is DisplayObjectContainer)
		{
			const container : DisplayObjectContainer = DisplayObjectContainer(displayObject);
			const total : int = container.numChildren;
			for(var i : int = 0; i < total; i++)
			{
				const child : DisplayObject = container.getChildAt(i);
				const childNode : DOMNode = cloneFromDisplayObjects(child);
				
				node.add(childNode);
			}
		}
		
		return node;
	}
}
