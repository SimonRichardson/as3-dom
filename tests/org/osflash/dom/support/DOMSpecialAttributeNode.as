package org.osflash.dom.support
{
	import org.osflash.dom.element.DOMNode;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMSpecialAttributeNode extends DOMNode
	{

		public function DOMSpecialAttributeNode(name : String)
		{
			super(name);
		}
		
		public function get special() : Boolean
		{
			return true;
		}
	}
}
