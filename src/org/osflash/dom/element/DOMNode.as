package org.osflash.dom.element
{
	import org.osflash.dom.dom_namespace;
	import org.osflash.dom.path.builder.DOMPathBuilder;
	import org.osflash.dom.path.builder.IDOMPathBuilder;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMNode extends DOMElement implements IDOMNode
	{
		
		/**
		 * Cache this here, because it's a lot faster at runtime.
		 */
		private static const NODE_NAME_REG_EXP : RegExp = /(\A[0-9])|([^a-zA-Z0-9\_])/;
		
		/**
		 * Private backing variable for name property.
		 * 
		 * @private
		 */
		private var _name : String;
		
		/**
		 * Private backing variable for index property.
		 * 
		 * @private
		 */
		private var _index : int;
				
		/**
		 * @private
		 */
		private var _path : IDOMPathBuilder;
		
		
		/**
		 * Private backing variable for parent property.
		 * 
		 * @private
		 */
		private var _parent : IDOMElement;
		
		/**
		 * Private backing variable for document property.
		 * 
		 * @private
		 */
		private var _document : IDOMDocument;
		
		/**
		 * 
		 */
		public function DOMNode(name : String)
		{
			super();
			
			this.name = name;
			
			_path = new DOMPathBuilder();			
		}
		
		/**
		 * @inheritDoc
		 */
		override public function addAt(node : IDOMNode, index : int) : IDOMNode
		{
			node = super.addAt(node, index);
			node.document = document;
			
			if(null != document && document.useCache)
				document.invalidated = true;
			
			return node;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function removeAt(index : int) : IDOMNode
		{
			const node : IDOMNode = super.removeAt(index);
			node.document = null;
			
			if(null != document && document.useCache)
				document.invalidated = true;
				
			return node;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get path() : IDOMPathBuilder
		{
			return _path;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get name() : String { return _name; }
		public function set name(value : String) : void
		{
			if(null == value || value.length < 1) 
				DOMElementError.throwError(DOMElementError.NODE_NAME_UNDEFINED);
			
			// Check we have a valid name. It can not start with a number or contain characters
			// that are not alphanumberic - underscores are allowed (we're following perl 
			// conventions to determin this.)
			const find : Array = value.match(NODE_NAME_REG_EXP);
			if(null != find && find.length > 0)
				DOMElementError.throwError(DOMElementError.NODE_NAME_INVALID);
			
			if(name == value) return;
			
			_name = value;	
		}
		
		/**
		 * @inheritDoc
		 */		
		public function get index() : int {	return _index; }
		public function set index(value : int) : void
		{
			if(index == value) return;			
			if(index < 0) throw new RangeError('Given index is out of range (index=' + index + ')');
			
			_index = value;
			
			// TODO : send signal here.
		}
		
		/**
		 * @inheritDoc
		 */		
		public function get parent() : IDOMElement { return _parent; }
		public function set parent(value : IDOMElement) : void
		{
			if(parent == value) return;
			
			_parent = value;
			
			_path.clear();
			_path.selectWithNode(this, false);
			
			// TODO : send signal here.
		}
		
		/**
		 * @inheritDoc
		 */
		public function get document() : IDOMDocument { return _document; }
		public function set document(value : IDOMDocument) : void
		{
			if(_document == value) return;
			
			_document = value;
			
			if(null != _document && _document.useCache)
				_document.invalidated = true;
			
			// TODO : we should send a signal here!
			
			if(numChildren > 0)
			{
				const nodes : Vector.<IDOMNode> = dom_namespace::children;
				var index : int = nodes.length;
				while(--index > -1)
				{
					nodes[index].document = _document;
				}
			}
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function get type() : IDOMElementType
		{
			return DOMElementType.NODE;
		}
		
		public function toString() : String 
		{
			return "[DOMNode (name=" + name + ")]";
		}
	}
}
