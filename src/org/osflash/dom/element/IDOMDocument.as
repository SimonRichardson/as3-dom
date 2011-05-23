package org.osflash.dom.element
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMDocument extends IDOMElement
	{
		
		function select(path : String) : Vector.<IDOMNode>;
	}
}
