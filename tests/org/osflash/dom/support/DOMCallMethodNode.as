package org.osflash.dom.support
{
	import org.osflash.dom.element.DOMNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMCallMethodNode extends DOMNode
	{

		public function DOMCallMethodNode(name : String)
		{
			super(name);
		}
		
		public function methodNoArg() : String
		{
			return "";
		}
		
		public function methodWithStringArg(value : String) : String
		{
			return value;
		}
	}
}
