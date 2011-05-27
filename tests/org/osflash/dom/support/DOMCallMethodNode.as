package org.osflash.dom.support
{
	import org.osflash.dom.element.DOMNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMCallMethodNode extends DOMNode
	{
		
		private var _prefix : String;
		
		public function DOMCallMethodNode(name : String, prefix : String = " ")
		{
			super(name);
			
			_prefix = prefix;
		}
		
		public function methodNoArg() : String
		{
			return _prefix;
		}
		
		public function methodWithStringArg(value : String) : String
		{
			return _prefix + "(" + value + ")";
		}
		
		public function methodWithMultipleArg(	value0 : String, 
												value1 : int, 
												value2 : String, 
												value3 : int, 
												value4 : Number
												) : String
		{
			return _prefix + "(" +  value0 + ", " + 
								 	value1 + ", " + 
								 	value2 + ", " + 
								 	value3 + ", " + 
								 	value4 + 
								 	")"; 
		}
	}
}
