package org.osflash.dom.path.builder
{
	import org.osflash.dom.element.IDOMNode;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathBuilder extends IDOMPathQuery
	{
		
		function selectWithNode(node : IDOMNode, relative : Boolean = true) : IDOMPathSelectBuilder;
		
		function selectWithString(nodeName : String) : IDOMPathSelectBuilder;
		
		function clear() : void;
		
		function toString() : String;
	}
}
