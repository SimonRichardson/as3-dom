package org.osflash.dom.element.debug.monitor.adapters
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.element.utils.getAllDOMElementChildren;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMNodeMonitorAdapter extends DOMElementMonitorAdapter
	{

		public function DOMNodeMonitorAdapter(node : IDOMNode)
		{
			super(node);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get active() : int { return length; }

		/**
		 * @inheritDoc
		 */
		override public function get free() : int {	return 0; }
		
		/**
		 * @inheritDoc
		 */
		override public function get length() : int 
		{ 
			return getAllDOMElementChildren(element).length;
		}
	}
}
