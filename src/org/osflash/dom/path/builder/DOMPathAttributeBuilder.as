package org.osflash.dom.path.builder
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathAttributeBuilder implements IDOMPathAttributeBuilder
	{

		/**
		 * @inheritDoc
		 */
		private var _attribute : String;
		
		/**
		 * @inheritDoc
		 */
		private var _stream : IDOMPathOutputStream;
		
		/**
		 * @inheritDoc
		 */
		private var _streamPosition : uint;

		public function DOMPathAttributeBuilder(stream : IDOMPathOutputStream, attribute : String)
		{
			_attribute = attribute;

			_stream = stream;
			_streamPosition = _stream.position;
			
			_stream.writeUTF('@');
			_stream.writeUTF(_attribute);
		}
		
		/**
		 * @inheritDoc
		 */
		public function atIndex(index : uint) : IDOMPathIndexBuilder
		{
			return new DOMPathIndexBuilder(_stream, index);
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
