package org.osflash.dom.path.builder
{
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.path.stream.DOMPathByteArrayOutputStream;
	import org.osflash.dom.path.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathBuilder implements IDOMPathBuilder
	{
		
		/**
		 * @private
		 */
		private var _stream : IDOMPathOutputStream;
		
		/**
		 * @private
		 */
		private var _context : DOMPathContextType;
		
		public function DOMPathBuilder(context : DOMPathContextType = null)
		{
			_stream = new DOMPathByteArrayOutputStream();
			
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
