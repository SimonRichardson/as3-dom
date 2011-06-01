package org.osflash.dom.element.displayadapaters
{
	import org.osflash.dom.element.IDOMNode;
	import flash.display.DisplayObject;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IDOMDisplayObjectNode extends IDOMNode
	{
		
		function get displayObject() : DisplayObject;
	}
}
