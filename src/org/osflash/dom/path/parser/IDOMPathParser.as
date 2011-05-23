package org.osflash.dom.path.parser
{
	import org.osflash.dom.path.IDOMPath;
	import org.osflash.dom.path.parser.tokens.IDOMPathTokenStream;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathParser
	{
		
		function parse(stream : IDOMPathTokenStream) : IDOMPath;
	}
}
