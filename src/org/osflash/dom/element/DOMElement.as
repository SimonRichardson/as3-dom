package org.osflash.dom.element
{
	import org.osflash.dom.dom_namespace;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMElement implements IDOMElement
	{

		use namespace dom_namespace;
		
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
			if(index < 0) throw new RangeError('Given index is out of range (index=' + index + ')');
			if(index > numChildren) throw new RangeError('Given index is outside of dense length');
			
			// Create the children if it was set to null.			
			if(null == _children) _children = new Vector.<IDOMNode>();
			
			// If it already exists, throw an error to prevent re-adding.
			if(contains(node)) DOMElementError.throwError(DOMElementError.NODE_ALREADY_EXISTS);
			
			// Reparent the node which you are trying to add.
			if(node.parent) node.parent.remove(node);
			
			var i : int;
			var total : int = _children.length;
			if(index == 0)
			{
				// Adding to the front
				_children.unshift(node);
				
				total = _children.length;
				for(i = 1; i < total; i++)
				{
					_children[i].index = i;
				}
			}
			else if(index == total)
			{
				// Adding to the rear
				_children.push(node);
			} 
			else
			{
				_children.splice(index, 1, node);
				
				i = total;
				while(--i > -1)
				{
					const child : IDOMNode = _children[i];
					// We don't actually need to reset all the index, because we assume that they
					// should be correct.
					if(child == node) break;
					child.index = i;
				}
			}
			
			node.index = index;
			node.parent = this;
			
			return node;
		}

		/**
		 * @inheritDoc
		 */
		public function getAt(index : int) : IDOMNode
		{
			if(index < 0 || index >= numChildren) throw new RangeError('Given index is out of ' + 
									'range (index=' + index + ', numChildren=' + numChildren + ')');
			return _children[index];
		}
		
		/**
		 * @inheritDoc
		 */
		public function getIndex(node : IDOMNode) : int
		{
			if(numChildren == 0 || !contains(node)) 
				DOMElementError.throwError(DOMElementError.NODE_DOES_NOT_EXIST);
			
			return _children.indexOf(node);
		}

		/**
		 * @inheritDoc
		 */
		public function remove(node : IDOMNode) : IDOMNode
		{
			const index : int = getIndex(node);
			if(index < 0) return null;	
			else return removeAt(index);
		}

		/**
		 * @inheritDoc
		 */
		public function removeAt(index : int) : IDOMNode
		{
			if(null == _children) return null;
			
			if(index < 0 || index >= numChildren) throw new RangeError('Given index is out of ' + 
									'range (index=' + index + ', numChildren=' + numChildren + ')');
			
			const nodes : Vector.<IDOMNode> = _children.splice(index, 1);
			if(nodes.length == 0) 
				DOMElementError.throwError(DOMElementError.REMOVE_NODE_LENGTH_ZERO);
			
			const domNode : IDOMNode = nodes[0];
			if(null == domNode) DOMElementError.throwError(DOMElementError.REMOVE_NODE_MISMATCH);
			
			domNode.index = -1;
			domNode.parent = null;
			
			if(numChildren == 0)
				_children = null;
			
			return domNode;
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeAll() : void
		{
			var index : int = _children.length;
			while(--index > -1)
			{
				removeAt(index);
			}
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
		public function containsType(type : IDOMElementType) : Boolean
		{
			if(null == _children) return false;
			
			var index : int = _children.length;
			while(--index > -1)
			{
				const node : IDOMNode = _children[index];
				if(node.type == type) return true;
			}
			return false;
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
		final public function get numChildren() : int
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
		
		/**
		 * @private
		 */
		dom_namespace function get children() : Vector.<IDOMNode> { return _children; }
	}
}
