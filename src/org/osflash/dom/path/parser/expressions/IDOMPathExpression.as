package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathExpression
	{
		
		function describe(stream : IDOMPathOutputStream) : void;
		
		function get type() : DOMPathExpressionType;
	}
}
