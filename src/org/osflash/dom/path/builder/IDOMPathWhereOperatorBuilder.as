package org.osflash.dom.path.builder
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathWhereOperatorBuilder extends IDOMPathQuery
	{
		
		function toInt(value : int) : IDOMPathWhereBuilder;
		
		function toUint(value : uint) : IDOMPathWhereBuilder;
		
		function toNumber(value : Number) : IDOMPathWhereBuilder;
		
		function toUTF(value : String) : IDOMPathWhereBuilder;
		
		function toBoolean(value : Boolean) : IDOMPathWhereBuilder;
		
		function toNull() : IDOMPathWhereBuilder;
		
		function toString() : String;
	}
}
