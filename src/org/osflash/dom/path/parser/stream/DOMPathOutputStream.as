package org.osflash.dom.path.parser.stream
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathOutputStream implements IDOMPathOutputStream
	{

		/**
		 * @private
		 */
		private var _buffer : String;

		public function DOMPathOutputStream()
		{
			_buffer = '';
		}

		/**
		 * @inheritDoc
		 */
		public function writeUTF(value : String) : void
		{
			_buffer += value;
		}
		
		/**
		 * Return the stream as a string
		 */
		public function toString() : String
		{
			return _buffer;
		}
	}
}
