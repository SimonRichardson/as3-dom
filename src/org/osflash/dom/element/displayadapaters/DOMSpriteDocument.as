package org.osflash.dom.element.displayadapaters
{
	import org.osflash.dom.element.DOMDocument;
	import org.osflash.dom.element.IDOMNode;

	import flash.display.Stage;
	/** 
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMSpriteDocument extends DOMDocument
	{
		
		/**
		 * @private
		 */
		private var _stage : Stage;
		
		public function DOMSpriteDocument(stage : Stage)
		{
			_stage = stage;
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
				if(!_stage.contains(displayObjectNode.displayObject))
					_stage.addChild(displayObjectNode.displayObject);
			}
			
			return domNode;
		}
		
		/**
		 * @inheritDoc
		 */	
		override public function removeAt(node : IDOMNode, index : int) : IDOMNode
		{
			const domNode : IDOMNode = super.removeAt(node, index);
			
			if(domNode is IDOMDisplayObjectNode)
			{
				const displayObjectNode : IDOMDisplayObjectNode = IDOMDisplayObjectNode(domNode);
				if(_stage.contains(displayObjectNode.displayObject))
					_stage.removeChild(displayObjectNode.displayObject);
			}
			
			return domNode;
		}
	}
}
