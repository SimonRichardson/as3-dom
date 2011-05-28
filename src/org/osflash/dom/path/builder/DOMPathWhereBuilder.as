package org.osflash.dom.path.builder
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class DOMPathWhereBuilder implements IDOMPathWhereBuilder
	{
		
		/**
		 * @private
		 */
		private var _name : String;
		
		/**
		 * @private
		 */
		private var _value : String;
		
		/**
		 * @private
		 */
		private var _stream : IDOMPathOutputStream;
		
		/**
		 * @private
		 */
		private var _streamPosition : int;
		
		public function DOMPathWhereBuilder(	stream : IDOMPathOutputStream, 
												name : String, 
												value : String
												)
		{
			_name = name;
			_value = value;
			
			_stream = stream;
			_streamPosition = _stream.position;
			
			_stream.writeUTF(name);
			_stream.writeUTF('==');
			_stream.writeUTF(value);
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
