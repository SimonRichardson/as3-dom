package org.osflash.dom.path.builder
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	import org.osflash.dom.path.DOMPathError;

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
		private var _args : Array;
		
		/**
		 * @inheritDoc
		 */
		private var _stream : IDOMPathOutputStream;
		
		/**
		 * @inheritDoc
		 */
		private var _streamPosition : uint;

		public function DOMPathMethodBuilder(	stream : IDOMPathOutputStream, 
												name : String, 
												args : Array
												)
		{
			_name = name;
			_args = args;
			
			_stream = stream;
			_streamPosition = _stream.position;
			
			_stream.writeUTF('.');
			_stream.writeUTF(name);
			_stream.writeUTF('(');
			
			const total : int = args.length;
			for(var i : int = 0; i < total; i++)
			{
				const type : String = getQualifiedClassName(args[i]);
				
				if(type == 'uint') _stream.writeUnsignedInt(args[i]);
				else if(type == 'int') _stream.writeInt(args[i]);
				else if(type == 'Number') _stream.writeFloat(args[i]);
				else if(type == 'String') 
				{
					_stream.writeUTF('"');
					_stream.writeUTF(args[i]);
					_stream.writeUTF('"');
				}
				else DOMPathError.throwError(DOMPathError.SYNTAX_ERROR);
				
				if(i < total - 1)
				{
					_stream.writeUTF(',');
				}
			}
			
			_stream.writeUTF(')');
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
