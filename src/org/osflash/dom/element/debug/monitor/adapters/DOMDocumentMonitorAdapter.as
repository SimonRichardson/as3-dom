package org.osflash.dom.element.debug.monitor.adapters
{
	import org.osflash.dom.element.DOMDocument;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMDocumentMonitorAdapter extends DOMNodeMonitorAdapter
	{

		public function DOMDocumentMonitorAdapter(document : DOMDocument)
		{
			super(document);
		}
	}
}
