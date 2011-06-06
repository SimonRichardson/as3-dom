package org.osflash.dom.path.builder
{
	import org.osflash.dom.path.DOMPathError;
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;

	import flash.utils.getQualifiedClassName;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathMethodBuilder implements IDOMPathMethodBuilder
	{
		
		/**
		 * @inheritDoc
		 */
		private var _name : String;
		
		/**
		 * @inheritDoc
		 */
		private var _stream : IDOMPathOutputStream;
		
		/**
		 * @inheritDoc
		 */
		private var _streamPosition : uint;

		public function DOMPathMethodBuilder(	stream : IDOMPathOutputStream, 
												name : String
												)
		{
			_name = name;
			
			_stream = stream;
			_streamPosition = _stream.position;
			
			_stream.writeUTF('.');
			_stream.writeUTF(name);
		}
		
		/**
		 * @inheritDoc
		 */
		public function addArguments(...args) : IDOMPathMethodBuilder
		{
			const values : Array = (args.length == 1 && args[0] is Array) ? args[0] : args;
			
			_stream.writeUTF('(');
			const total : int = values.length;
			for(var i : int = 0; i < total; i++)
			{
				const def : String = getQualifiedClassName(values[i]);
				switch(def)
				{
					case 'null':
						_stream.writeUTF('null');
						break;
					case 'int':
						_stream.writeInt(values[i]);
						break;
					case 'uint':
						_stream.writeUnsignedInt(values[i]);
						break;
					case 'Number':
						_stream.writeFloat(values[i]);
						break;
					case 'Boolean':
						_stream.writeBoolean(values[i]);
						break;
					case 'String':
						_stream.writeUTF('"');
						_stream.writeUTF(values[i]);
						_stream.writeUTF('"');
						break;
					default:
						if("toString" in args[i])
						{
							_stream.writeUTF('"');
							_stream.writeUTF(values[i]['toString']());
							_stream.writeUTF('"');
						}
						else 
							DOMPathError.throwError(DOMPathError.UNEXPECTED_ARGUMENT);
				}
				// Add the comma
				if(i < total - 1) _stream.writeUTF(',');
			}
			_stream.writeUTF(')');
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function startArguments() : IDOMPathMethodArgumentBuilder
		{
			return new DOMPathMethodArgumentBuilder(this);
		}
		
		/**
		 * @inheritDoc
		 */
		public function toQuery() : String
		{
			_stream.position = 0;
			return _stream.toString();
		}

		public function toString() : String
		{
			_stream.position = _streamPosition;
			return _stream.toString();
		}
	}
}
