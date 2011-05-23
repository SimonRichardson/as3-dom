package org.osflash.dom.path.parser
{
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathTokenIterator
	{
		
		function get hasNext() : Boolean;
		
		function get next() : DOMPathToken;
	}
}
