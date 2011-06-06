package org.osflash.dom.path.builder
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public interface IDOMPathWhereBuilder extends IDOMPathQuery
	{
		
		function equals() : IDOMPathWhereOperatorBuilder;
		
		function isLessThan() : IDOMPathWhereOperatorBuilder;
		
		function isLessThanOrEqualTo() : IDOMPathWhereOperatorBuilder
		
		function isGreaterThan() : IDOMPathWhereOperatorBuilder
		
		function isGreaterThanOrEqualTo() : IDOMPathWhereOperatorBuilder
		
		function and(value : String) : IDOMPathWhereBuilder;
		
		function or(value : String) : IDOMPathWhereBuilder;
		
		function endWhere() : IDOMPathSelectBuilder;
		
		function toString() : String;
	}
}
