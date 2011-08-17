package org.osflash.dom.path.builder
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.stream.IStreamOutput;
	import org.osflash.stream.types.bytearray.StreamByteArrayOutput;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathBuilder implements IDOMPathBuilder
	{
		
		/**
		 * @private
		 */
		private var _stream : IStreamOutput;
		
		/**
		 * @private
		 */
		private var _context : DOMPathContextType;
		
		public function DOMPathBuilder(context : DOMPathContextType = null)
		{
			_stream = new StreamByteArrayOutput();
			
			_context = context || DOMPathContextType.CONTEXT;
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
			
			// We terversing from bottom up, so we need to flip it!
			path.reverse();
			
			return new DOMPathSelectBuilder(_stream, path.join("/"), _context);
		}
		
		/**
		 * @inheritDoc
		 */
		public function selectWithString(nodeName : String) : IDOMPathSelectBuilder
		{
			return new DOMPathSelectBuilder(_stream, nodeName, _context);
		}
		
		/**
		 * @inheritDoc
		 */
		public function clear() : void
		{
			_stream.clear();
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
			_stream.position = 0;
			return _stream.toString();
		}
	}
}
