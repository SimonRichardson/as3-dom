package org.osflash.dom
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMElement extends IDOMUniqueIdentifier
	{
		
		function add(node : IDOMNode) : IDOMNode;
		
		function addAt(node : IDOMNode, index : int) : IDOMNode;
		
		function getAt(index : int) : IDOMNode;
		
		function remove(node : IDOMNode) : IDOMNode;
		
		function removeAt(node : IDOMNode, index : int) : IDOMNode;
		
		function contains(node : IDOMNode) : Boolean;
		
		function find(id : String) : IDOMNode;
		
		function get numChildren() : int;
		
		function get type() : IDOMNodeType;
	}
}
