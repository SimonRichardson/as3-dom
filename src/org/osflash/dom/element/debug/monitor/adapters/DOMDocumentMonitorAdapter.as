package org.osflash.dom.element.debug.monitor.adapters
{
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.utils.getAllDOMElementChildren;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMDocumentMonitorAdapter extends DOMElementMonitorAdapter
	{

		public function DOMDocumentMonitorAdapter(document : IDOMDocument)
		{
			super(document);
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
