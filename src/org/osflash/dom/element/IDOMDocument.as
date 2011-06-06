package org.osflash.dom.element
{
	import org.osflash.dom.path.builder.IDOMPathBuilder;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMDocument extends IDOMElement
	{
		
		function select(path : String) : Vector.<IDOMNode>;
		
		function query(path : IDOMPathBuilder) : Vector.<IDOMNode>;
		
		function get useCache() : Boolean;
		function set useCache(value : Boolean) : void; 
		
		function get invalidated() : Boolean;
		function set invalidated(value : Boolean) : void;
	}
}
