package org.osflash.dom.path.builder
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathSelectBuilder implements IDOMPathSelectBuilder
	{

		/**
		 * @private
		 */
		private var _name : String;

		/**
		 * @private
		 */
		private var _stream : IDOMPathOutputStream;
		
		/**
		 * @private
		 */
		private var _streamPosition : int;

		public function DOMPathSelectBuilder(stream : IDOMPathOutputStream, name : String)
		{
			_name = name;

			_stream = stream;
			_streamPosition = _stream.position;
			
			_stream.writeUTF('/');
			_stream.writeUTF(name);
		}

		/**
		 * @inheritDoc
		 */
		public function atIndex(index : uint) : IDOMPathIndexBuilder
		{
			return withIndex(index);
		}

		/**
		 * @inheritDoc
		 */
		public function withIndex(index : uint) : IDOMPathIndexBuilder
		{
			return new DOMPathIndexBuilder(_stream, index);
		}

		/**
		 * @inheritDoc
		 */
		public function attribute(name : String) : IDOMPathAttributeBuilder
		{
			return withAttribute(name);
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
		public function callingMethod(name : String, ...args) : IDOMPathMethodBuilder
		{
			return andCallingMethod.apply(null, [name].concat(args));
		}

		/**
		 * @inheritDoc
		 */
		public function andCallingMethod(name : String, ...args) : IDOMPathMethodBuilder
		{
			return new DOMPathMethodBuilder(_stream, name, args);
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
