package org.osflash.dom.element
{
	import org.osflash.dom.path.IDOMPath;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMNode extends IDOMElement
	{
		function get path() : IDOMPath;
		
		function get name() : String;		
		function set name(value : String) : void;
		
		function get index() : int;
		function set index(value : int) : void;
		
		function get parent() : IDOMElement;
		function set parent(value : IDOMElement) : void;
		
		function get document() : IDOMDocument;
		function set document(value : IDOMDocument) : void;
	}
}
