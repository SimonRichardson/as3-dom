package org.osflash.dom.path.builder
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathIndexBuilder implements IDOMPathIndexBuilder
	{
		
		/**
		 * @inheritDoc
		 */
		private var _index : uint;
		
		/**
		 * @inheritDoc
		 */
		private var _stream : IDOMPathOutputStream;
		
		/**
		 * @inheritDoc
		 */
		private var _streamPosition : uint;

		public function DOMPathIndexBuilder(stream : IDOMPathOutputStream, index : uint)
		{
			_index = index;

			_stream = stream;
			_streamPosition = _stream.position;
			
			_stream.writeUTF('[');
			_stream.writeUnsignedInt(_index);
			_stream.writeUTF(']');
		}
		
		/**
		 * @inheritDoc
		 */
		public function toQuery() : String
		{
			_stream.position = 0;
			return _stream.toString();
		}
		
		/**
		 * @inheritDoc
		 */
		public function toString() : String
		{
			_stream.position = _streamPosition;
			return _stream.toString();
		}
	}
}
