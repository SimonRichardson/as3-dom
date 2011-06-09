package org.osflash.dom.element.displayadapaters
{
	import org.osflash.dom.element.DOMNode;
	import org.osflash.dom.element.IDOMNode;

	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMMovieClipNode extends DOMNode implements IDOMDisplayObjectContainerNode
	{
		
		/**
		 * @private
		 */
		private var _movieClip : MovieClip;

		public function DOMMovieClipNode(name : String)
		{
			super(name);
			
			_movieClip = new MovieClip();
			_movieClip.name = name;
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
				if(!_movieClip.contains(displayObjectNode.displayObject))
					_movieClip.addChild(displayObjectNode.displayObject);
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
				if(_movieClip.contains(displayObjectNode.displayObject))
					_movieClip.removeChild(displayObjectNode.displayObject);
			}
			
			return domNode;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get displayObject() : DisplayObject
		{
			return _movieClip;
		}
	}
}
