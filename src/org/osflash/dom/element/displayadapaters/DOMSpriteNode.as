package org.osflash.dom.element.displayadapaters
{
	import org.osflash.dom.element.DOMNode;
	import org.osflash.dom.element.IDOMNode;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMSpriteNode extends DOMNode implements IDOMDisplayObjectContainerNode
	{
		
		/**
		 * @private
		 */
		private var _sprite : Sprite;

		public function DOMSpriteNode(name : String)
		{
			super(name);
			
			_sprite = new Sprite();
			_sprite.name = name;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function addAt(node : IDOMNode, index : int) : IDOMNode
		{
			const domNode : IDOMNode = super.addAt(node, index);
			
			if(domNode is IDOMDisplayObjectNode)
			{
				const displayObjectNode : IDOMDisplayObjectNode = IDOMDisplayObjectNode(domNode);
				if(!_sprite.contains(displayObjectNode.displayObject))
					_sprite.addChild(displayObjectNode.displayObject);
			}
			
			return domNode;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function removeAt(index : int) : IDOMNode
		{
			const domNode : IDOMNode = super.removeAt(index);
			
			if(domNode is IDOMDisplayObjectNode)
			{
				const displayObjectNode : IDOMDisplayObjectNode = IDOMDisplayObjectNode(domNode);
				if(_sprite.contains(displayObjectNode.displayObject))
					_sprite.removeChild(displayObjectNode.displayObject);
			}
			
			return domNode;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get displayObject() : DisplayObject
		{
			return _sprite;
		}
	}
}
