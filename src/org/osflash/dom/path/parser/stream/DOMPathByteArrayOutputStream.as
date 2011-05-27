package org.osflash.dom.path.parser.stream
{
	import flash.errors.IllegalOperationError;
	import flash.utils.ByteArray;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathByteArrayOutputStream implements IDOMPathOutputStream
	{
		
		public static const UTF : int = 0;
		
		public static const INT : int = 1;
		
		public static const UINT : int = 2;
		
		public static const FLOAT : int = 3;
		
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
			_buffer.writeByte(UTF);
			_buffer.writeUTF(value);
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeInt(value : int) : void
		{
			_buffer.writeByte(INT);
			_buffer.writeInt(value);
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeUnsignedInt(value : uint) : void
		{
			_buffer.writeByte(UINT);
			_buffer.writeUnsignedInt(value);
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeFloat(value : Number) : void
		{
			_buffer.writeByte(FLOAT);
			_buffer.writeFloat(value);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get position() : uint
		{
			return _buffer.position;
		}
		
		/**
		 * @inheritDoc
		 */
		public function set position(value : uint) : void
		{
			_buffer.position = value;
		}
		
		/**
		 * Return the stream as a string
		 */
		public function toString() : String
		{
			const stream : IDOMPathOutputStream = new DOMPathStringOutputStream();
			
			while(_buffer.position < _buffer.length)
			{
				switch(_buffer.readByte())
				{
					case UTF: stream.writeUTF(_buffer.readUTF()); break;
					case INT: stream.writeInt(_buffer.readInt()); break;
					case UINT: stream.writeUnsignedInt(_buffer.readUnsignedInt()); break;
					case FLOAT: stream.writeFloat(_buffer.readFloat()); break;
					default: 
						throw new IllegalOperationError();
						break;
				}
			}
			
			stream.position = 0;
			
			return stream.toString();
		}
	}
}
