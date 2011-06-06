package org.osflash.dom.path.stream
{
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathStringOutputStream implements IDOMPathOutputStream
	{

		/**
		 * @private
		 */
		private var _buffer : String;
		
		/**
		 * @private
		 */
		private var _position : uint;
		
		public function DOMPathStringOutputStream()
		{
			_buffer = '';
			_position = 0;
		}

		/**
		 * @inheritDoc
		 */
		public function writeUTF(value : String) : void
		{
			const parts : Array = _buffer.split('');
			parts.splice(position, 0, value);
			
			_buffer = parts.join('');
			_position += value.length;
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeInt(value : int) : void
		{
			const parts : Array = _buffer.split('');
			parts.splice(position, 0, value);
			
			_buffer = parts.join('');
			_position += value.toString().length;
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeUnsignedInt(value : uint) : void
		{
			const parts : Array = _buffer.split('');
			parts.splice(position, 0, value);
			
			_buffer = parts.join('');
			_position += value.toString().length;
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeFloat(value : Number) : void
		{
			const parts : Array = _buffer.split('');
			parts.splice(position, 0, value);
			
			_buffer = parts.join('');
			_position += value.toString().length;
		}
		
		/**
		 * @inheritDoc
		 */
		public function writeBoolean(value : Boolean) : void
		{
			const string : String = value ? 'true' : 'false';
			
			const parts : Array = _buffer.split('');
			parts.splice(position, 0, string);
			
			_buffer = parts.join('');
			_position += string.length;
		}
		
		/**
		 * @inheritDoc
		 */
		public function clear() : void
		{
			_buffer = "";
			_position = 0;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get position() : uint
		{
			return _position;
		}
		
		/**
		 * @inheritDoc
		 */
		public function set position(value : uint) : void
		{
			_position = value;
		}
		
		/**
		 * Return the stream as a string
		 */
		public function toString() : String
		{
			return _buffer.substr(_position);
		}
	}
}
