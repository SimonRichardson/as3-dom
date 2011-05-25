package org.osflash.dom.path.parser.stream
{
	import flash.utils.ByteArray;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathByteArrayOutputStream implements IDOMPathOutputStream
	{

		/**
		 * @private
		 */
		private var _buffer : ByteArray;

		public function DOMPathByteArrayOutputStream()
		{
			_buffer = new ByteArray();
		}

		/**
		 * @inheritDoc
		 */
		public function writeUTF(value : String) : void
		{
			_buffer.writeUTF(value);
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeInt(value : int) : void
		{
			_buffer.writeInt(value);
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeDouble(value : Number) : void
		{
			_buffer.writeDouble(value);
		}
		
		/**
		 * Return the stream as a string
		 */
		public function toString() : String
		{
			return _buffer.toString();
		}
	}
}
