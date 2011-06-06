package org.osflash.dom.path.builder
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathMethodArgumentBuilder implements IDOMPathMethodArgumentBuilder
	{
		
		/**
		 * @private
		 */
		private var _method : IDOMPathMethodBuilder;
		
		/**
		 * @private
		 */
		private var _arguments : Array;
		
		public function DOMPathMethodArgumentBuilder(method : IDOMPathMethodBuilder)
		{
			_method = method;
			
			_arguments = [];
		}

		/**
		 * @inheritDoc
		 */
		public function addInt(value : int) : IDOMPathMethodArgumentBuilder
		{
			_arguments.push(value);
			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function addUint(value : uint) : IDOMPathMethodArgumentBuilder
		{
			_arguments.push(value);
			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function addNumber(value : Number) : IDOMPathMethodArgumentBuilder
		{
			_arguments.push(value);
			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function addString(value : String) : IDOMPathMethodArgumentBuilder
		{
			_arguments.push(value);
			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function addBoolean(value : Boolean) : IDOMPathMethodArgumentBuilder
		{
			_arguments.push(value);
			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function addArray(value : Array) : IDOMPathMethodArgumentBuilder
		{
			_arguments = _arguments.concat(value);
			return this;
		}

		/**
		 * @inheritDoc
		 */
		public function endArguments() : IDOMPathMethodBuilder
		{
			_method.addArguments(_arguments);
			return _method;
		}
	}
}
