package org.osflash.dom.element
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMDocument extends IDOMElement
	{
		
		function getElementsById(id : String) : Vector.<IDOMNode>;
		
		function select(path : String) : Vector.<IDOMNode>;
	}
}
