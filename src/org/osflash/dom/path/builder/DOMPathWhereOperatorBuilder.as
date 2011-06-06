package org.osflash.dom.path.builder
{
	import org.osflash.dom.path.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathWhereOperatorBuilder implements IDOMPathWhereOperatorBuilder
	{
		
		/**
		 * @private
		 */
		private var _where : IDOMPathWhereBuilder;
		
		/**
		 * @private
		 */
		private var _stream : IDOMPathOutputStream;
		
		/**
		 * @private
		 */
		private var _streamPosition : int;
		
		public function DOMPathWhereOperatorBuilder(	stream : IDOMPathOutputStream, 
														where : IDOMPathWhereBuilder,
														operator : String
														)
		{
			_where = where;
			
			_stream = stream;
			_streamPosition = _stream.position;
			
			_stream.writeUTF(operator);
		}

		/**
		 * @inheritDoc
		 */
		public function toInt(value : int) : IDOMPathWhereBuilder
		{
			_stream.writeInt(value);
			
			return _where;
		}

		/**
		 * @inheritDoc
		 */
		public function toUint(value : uint) : IDOMPathWhereBuilder
		{
			_stream.writeUnsignedInt(value);
			
			return _where;
		}

		/**
		 * @inheritDoc
		 */
		public function toNumber(value : Number) : IDOMPathWhereBuilder
		{
			_stream.writeFloat(value);
			
			return _where;
		}

		/**
		 * @inheritDoc
		 */
		public function toUTF(value : String) : IDOMPathWhereBuilder
		{
			_stream.writeUTF('"');
			_stream.writeUTF(value);
			_stream.writeUTF('"');
			
			return _where;
		}

		/**
		 * @inheritDoc
		 */
		public function toBoolean(value : Boolean) : IDOMPathWhereBuilder
		{
			_stream.writeBoolean(value);
			
			return _where;
		}

		/**
		 * @inheritDoc
		 */
		public function toNull() : IDOMPathWhereBuilder
		{
			_stream.writeUTF('null');
			
			return _where;
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
