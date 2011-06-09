package org.osflash.dom.path.builder
{
	import org.osflash.dom.path.DOMPathError;
	import org.osflash.stream.IStreamOutput;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathSelectBuilder implements IDOMPathSelectBuilder
	{

		/**
		 * @private
		 */
		private var _nodeName : String;

		/**
		 * @private
		 */
		private var _context : DOMPathContextType;

		/**
		 * @private
		 */
		private var _stream : IStreamOutput;
		
		/**
		 * @private
		 */
		private var _streamPosition : int;

		public function DOMPathSelectBuilder(	stream : IStreamOutput, 
												nodeName : String,
												context : DOMPathContextType = null
												)
		{
			_nodeName = nodeName;

			_stream = stream;
			_streamPosition = _stream.position;
			
			_context = context || DOMPathContextType.CONTEXT; 
			if(_context == DOMPathContextType.CONTEXT)
				_stream.writeUTF('/');
			else if(_context == DOMPathContextType.DOCUMENT)
			{
				_stream.writeUTF('/');
				_stream.writeUTF('/');
			}
			else DOMPathError.throwError(DOMPathError.UNEXPECTED_CONTEXT_TYPE);
				
			_stream.writeUTF(_nodeName);
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
		public function withAttribute(name : String) : IDOMPathAttributeBuilder
		{
			return new DOMPathAttributeBuilder(_stream, name);
		}

		/**
		 * @inheritDoc
		 */
		public function andCallingMethod(name : String) : IDOMPathMethodBuilder
		{
			return new DOMPathMethodBuilder(_stream, name);
		}
		
		/**
		 * @inheritDoc
		 */
		public function where(name : String) : IDOMPathWhereBuilder
		{
			return new DOMPathWhereBuilder(_stream, this, name);
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
