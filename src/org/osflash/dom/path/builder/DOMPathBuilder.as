package org.osflash.dom.path.builder
{
	import org.osflash.dom.path.parser.stream.DOMPathByteArrayOutputStream;
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathBuilder implements IDOMPathBuilder
	{
		
		private var _stream : IDOMPathOutputStream;
		
		public function DOMPathBuilder()
		{
			_stream = new DOMPathByteArrayOutputStream();
		}
		
		/**
		 * @inheritDoc
		 */
		public function select(name : String) : IDOMPathSelectBuilder
		{
			return new DOMPathSelectBuilder(_stream, name);
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
			_stream.position = 0;
			return _stream.toString();
		}
	}
}
