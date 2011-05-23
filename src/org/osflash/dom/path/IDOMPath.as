package org.osflash.dom.path
{
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPath
	{
		
		function execute(element : IDOMElement) : Vector.<IDOMNode>;
	}
}
