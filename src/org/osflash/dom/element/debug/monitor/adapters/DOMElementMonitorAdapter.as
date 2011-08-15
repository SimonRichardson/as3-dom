package org.osflash.dom.element.debug.monitor.adapters
{
	import org.osflash.debug.monitor.adapters.BaseMonitorAdapter;
	import org.osflash.dom.dom_namespace;
	import org.osflash.dom.element.IDOMElement;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMElementMonitorAdapter extends BaseMonitorAdapter
	{

		use namespace dom_namespace;
		
		/**
		 * @private
		 */
		private var _element : IDOMElement;

		public function DOMElementMonitorAdapter(element : IDOMElement)
		{
			super(element);
			
			if(null == element) throw new ArgumentError('Element can not be null');
			
			_element = element;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get active() : int { return _element.numChildren; }

		/**
		 * @inheritDoc
		 */
		override public function get free() : int {	return 0; }
		
		/**
		 * @inheritDoc
		 */
		override public function get length() : int { return _element.numChildren; }
		
		protected function get element() : IDOMElement { return _element; }
	}
}
