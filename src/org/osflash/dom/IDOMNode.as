package org.osflash.dom
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMNode
	{
		
		function get document() : IDOMDocument;
		
		function get parent() : IDOMElement;
		
		function get index() : int;
		
		function get path() : IDOMPath;
		
		function get name() : String;		
		function set name(value : String) : void;
	}
}
