package org.osflash.dom.element
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMElement extends IDOMUniqueIdentifier
	{
		
		function add(node : IDOMNode) : IDOMNode;
		
		function addAt(node : IDOMNode, index : int) : IDOMNode;
		
		function getAt(index : int) : IDOMNode;
		
		function getIndex(node : IDOMNode) : int;
		
		function remove(node : IDOMNode) : IDOMNode;
		
		function removeAt(index : int) : IDOMNode;
		
		function contains(node : IDOMNode) : Boolean;
		
		function find(id : String) : IDOMNode;
		
		function get numChildren() : int;
		
		function get type() : IDOMElementType;
	}
}
