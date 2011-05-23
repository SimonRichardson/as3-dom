package org.osflash.dom.element
{
	import org.osflash.dom.element.DOMElement;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.path.IDOMPath;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMNode extends DOMElement implements IDOMNode
	{
		
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
		public function DOMNode()
		{
			super();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function addAt(node : IDOMNode, index : int) : IDOMNode
		{
			node = super.addAt(node, index);
			node.document = document;
			return node;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function removeAt(node : IDOMNode, index : int) : IDOMNode
		{
			node = super.removeAt(node, index);
			node.document = null;
			return node;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get path() : IDOMPath
		{
			return null;
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
			if(value.match(/(\A[0-9])|([^a-zA-Z0-9\_])/g).length > 0)
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
			
			// TODO : we should send a signal here!
			
			if(numChildren > 0)
			{
				var index : int = children.length;
				while(--index > -1)
				{
					children[index].document = _document;
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
	}
}
