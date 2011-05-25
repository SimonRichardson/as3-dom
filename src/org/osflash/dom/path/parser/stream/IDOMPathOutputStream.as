package org.osflash.dom.path.parser.stream
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public interface IDOMPathOutputStream
	{
		
		function writeInt(value : int) : void;
		
		function writeDouble(value : Number) : void;
		
		function writeUTF(value : String) : void;
		
		function toString() : String;
	}
}
