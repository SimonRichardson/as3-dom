package org.osflash.dom.element
{

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMElement implements IDOMElement
	{
		
		/**
		 * @private
		 */
		private var _id : String;
		
		/**
		 * @private
		 */
		private var _children : Vector.<IDOMNode>;
		
		/**
		 * Default constructor for the DOMElement
		 */
		public function DOMElement()
		{
		}

		/**
		 * @inheritDoc
		 */
		public function add(node : IDOMNode) : IDOMNode
		{
			return addAt(node, numChildren);
		}

		/**
		 * @inheritDoc
		 */
		public function addAt(node : IDOMNode, index : int) : IDOMNode
		{
			// TODO: Auto-generated method stub
			return null;
		}

		/**
		 * @inheritDoc
		 */
		public function getAt(index : int) : IDOMNode
		{
			if(index < 0 || index >= numChildren) throw new RangeError('Given index is out of ' + 
									'Range (index=' + index + ', numChildren=' + numChildren + ')');
			return _children[index];
		}
		
		/**
		 * @inheritDoc
		 */
		public function getIndex(node : IDOMNode) : int
		{
			if(numChildren == 0 || !contains(node)) 
				DOMError.throwError(DOMError.NODE_DOES_NOT_EXIST);
			
			return _children.indexOf(node);
		}

		/**
		 * @inheritDoc
		 */
		public function remove(node : IDOMNode) : IDOMNode
		{
			return removeAt(node, numChildren - 1);
		}

		/**
		 * @inheritDoc
		 */
		public function removeAt(node : IDOMNode, index : int) : IDOMNode
		{
			if(null == _children) return null;
			
			if(index < 0 || index >= numChildren) throw new RangeError('Given index is out of ' + 
									'Range (index=' + index + ', numChildren=' + numChildren + ')');
			
			const nodes : Vector.<IDOMNode> = _children.splice(index, 1);
			if(nodes.length == 0) DOMError.throwError(DOMError.REMOVE_NODE_LENGTH_ZERO);
			
			const domNode : IDOMNode = nodes[0];
			if(domNode != node) DOMError.throwError(DOMError.REMOVE_NODE_MISMATCH);
			
			domNode.index = -1;
			domNode.parent = null;
			
			if(numChildren == 0)
			{
				_children = null;
			}
			
			return domNode;
		}

		/**
		 * @inheritDoc
		 */
		public function contains(node : IDOMNode) : Boolean
		{
			return null != _children ? _children.indexOf(node) >= 0 : false;
		}

		/**
		 * @inheritDoc
		 */
		public function find(id : String) : IDOMNode
		{
			if(null == _children) return null;
			
			var index : int = _children.length;
			while(--index > -1)
			{
				const node : IDOMNode = _children[index];
				if(node.id == id) return node;
			}
			return null;
		}

		/**
		 * @inheritDoc
		 */
		public function get numChildren() : int
		{
			return null != _children ? _children.length : 0;
		}

		/**
		 * @inheritDoc
		 */
		public function get type() : IDOMElementType { return DOMElementType.ELEMENT; }
		
		/**
		 * @inheritDoc
		 */
		public function get id() : String { return _id; }
		public function set id(value : String) : void { _id = value; }
	}
}
