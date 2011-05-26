package org.osflash.dom.element.utils
{
	import flash.display.DisplayObjectContainer;
	import asunit.asserts.assertEquals;
	import org.osflash.dom.element.DOMNode;

	import flash.display.Shape;
	import flash.display.Sprite;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class CloneFromDisplayObjectsTest
	{
		
		protected var root : Sprite;
		
		protected var node : DOMNode;
		
		[Before]
		public function setUp() : void
		{
			root = new Sprite();
			
			const child0 : Shape = new Shape();
			const child1 : Sprite = new Sprite();
			const child2 : Sprite = new Sprite();
			
			const subchild0 : Sprite = new Sprite();
			const subchild1 : Shape = new Shape();
			const subchild2 : Sprite = new Sprite();
			
			root.addChild(child0);
			root.addChild(child1);
			root.addChild(child2);
			
			child1.addChild(subchild0);
			
			child2.addChild(subchild1);
			child2.addChild(subchild2);
			
			node = cloneFromDisplayObjects(root);
		}
		
		[After]
		public function tearDown() : void
		{
			root = null;
			node = null;
		}
		
		[Test]
		public function verify_node_numChildren_length() : void
		{
			assertEquals('numChildren in node should be 3', 3, node.numChildren);
		}
		
		[Test]
		public function verify_node_at_0_is_child0_of_displayObject() : void
		{
			assertEquals('Node at 0 index should be child 0', 
																root.getChildAt(0).name, 
																node.getAt(0).name
																);
		}
		
		[Test]
		public function verify_node_at_0_has_0_children() : void
		{
			assertEquals('Node at 0 index should have 0 children', 
																0, 
																node.getAt(0).numChildren
																);
		}
		
		[Test]
		public function verify_node_at_1_is_child1_of_displayObject() : void
		{
			assertEquals('Node at 1 index should be child 1', 
																root.getChildAt(1).name, 
																node.getAt(1).name
																);
		}
		
		[Test]
		public function verify_node_at_0_has_1_child() : void
		{
			assertEquals('Node at 1 index should have 1 child', 
																1, 
																node.getAt(1).numChildren
																);
		}
		
		[Test]
		public function verify_node_at_2_is_child2_of_displayObject() : void
		{
			assertEquals('Node at 2 index should be child 2', 
																root.getChildAt(2).name, 
																node.getAt(2).name
																);
		}
		
		[Test]
		public function verify_node_at_0_has_2_children() : void
		{
			assertEquals('Node at 2 index should have 2 children', 
																2, 
																node.getAt(2).numChildren
																);
		}
		
		[Test]
		public function verify_node1_subnode0_is_subchild0_of_displayObject() : void
		{
			assertEquals('Subnode 0 of node at 1 index should be subchild 0', 
									DisplayObjectContainer(root.getChildAt(1)).getChildAt(0).name, 
									node.getAt(1).getAt(0).name
									);
		}
		
		[Test]
		public function verify_node2_subnode0_is_subchild1_of_displayObject() : void
		{
			assertEquals('Subnode 0 of node at 2 index should be subchild 1', 
									DisplayObjectContainer(root.getChildAt(2)).getChildAt(0).name, 
									node.getAt(2).getAt(0).name
									);
		}
		
	}
}
