package org.osflash.dom.element
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMDocument extends DOMNode implements IDOMDocument
	{

		public function DOMDocument()
		{
		}

		/**
		 * @inheritDoc
		 */
		public function select(path : String) : Vector.<IDOMNode>
		{
			// TODO : work out how to select here
			return null;
		}
	}
}
