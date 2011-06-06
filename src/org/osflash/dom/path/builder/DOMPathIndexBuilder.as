package org.osflash.dom.path.builder
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathIndexBuilder implements IDOMPathIndexBuilder
	{
		
		/**
		 * @private
		 */
		private var _index : uint;
		
		/**
		 * @private
		 */
		private var _stream : IDOMPathOutputStream;
		
		/**
		 * @private
		 */
		private var _streamPosition : uint;

		public function DOMPathIndexBuilder(stream : IDOMPathOutputStream, index : uint)
		{
			_index = index;

			_stream = stream;
			_streamPosition = _stream.position;
			
			_stream.writeUTF('[');
			_stream.writeUnsignedInt(_index);
			_stream.writeUTF(']');
		}
		
		/**
		 * @inheritDoc
		 */
		public function selectWithNode(	node : IDOMNode, 
										relative : Boolean = true
										) : IDOMPathSelectBuilder
		{
			const path : Vector.<String> = new Vector.<String>();
			if(!relative)
			{
				while(node.parent)
				{
					path.push(node.name);
					node = node.parent as IDOMNode;
				}
			}
			else path.push(node.name);
			return new DOMPathSelectBuilder(_stream, path.join("/"), DOMPathContextType.CONTEXT);
		}
		
		/**
		 * @inheritDoc
		 */
		public function selectWithString(nodeName : String) : IDOMPathSelectBuilder
		{
			return new DOMPathSelectBuilder(_stream, nodeName, DOMPathContextType.CONTEXT);
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
