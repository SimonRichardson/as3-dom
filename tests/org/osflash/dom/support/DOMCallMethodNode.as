package org.osflash.dom.support
{
	import org.osflash.dom.element.DOMNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMCallMethodNode extends DOMNode
	{
		
		private var _prefix : String;
		
		public function DOMCallMethodNode(name : String, prefix : String = "")
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
			return _prefix + value;
		}
	}
}
