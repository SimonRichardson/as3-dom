package org.osflash.dom.path.parser.expressions
{
	import org.osflash.stream.IStreamOutput;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathExpression
	{
		
		function describe(stream : IStreamOutput) : void;
		
		function get type() : DOMPathExpressionType;
	}
}
