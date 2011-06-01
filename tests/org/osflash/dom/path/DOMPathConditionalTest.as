package org.osflash.dom.path
{
	import asunit.asserts.assertEquals;

	import org.osflash.dom.element.DOMDocument;
	import org.osflash.dom.element.DOMNode;
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.IDOMNode;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathConditionalTest
	{
		
		protected var document : IDOMDocument;

		[Before]
		public function setUp() : void
		{
			document = new DOMDocument();
		}

		[After]
		public function tearDown() : void
		{
			document = null;
		}
		
		[Test]
		public function path_select_node1_and_attribute_name_equals_node1() : void
		{
			const node0 : IDOMNode = new DOMNode('node0');
			const node1 : IDOMNode = new DOMNode('node1');
			const node2 : IDOMNode = new DOMNode('node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
									
			const result : Vector.<IDOMNode> = document.select('node1.(@name=="node1")');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function path_select_node1_and_attribute_name_equals_node1_in_context() : void
		{
			const node0 : IDOMNode = new DOMNode('node0');
			const node1 : IDOMNode = new DOMNode('node1');
			const node2 : IDOMNode = new DOMNode('node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
									
			const result : Vector.<IDOMNode> = document.select('/node1(@name=="node1")');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function path_select_node1_and_attribute_name_equals_node1_in_document() : void
		{
			const node0 : IDOMNode = new DOMNode('node0');
			const node1 : IDOMNode = new DOMNode('node1');
			const node2 : IDOMNode = new DOMNode('node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
									
			const result : Vector.<IDOMNode> = document.select('//node1(@name=="node1")');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function path_select_subnode1_and_attribute_name_equals_subnode1() : void
		{
			const node0 : IDOMNode = new DOMNode('node0');
			const node1 : IDOMNode = new DOMNode('node1');
			const node2 : IDOMNode = new DOMNode('node1');
			
			const subnode0 : IDOMNode = new DOMNode('subnode1');
			const subnode1 : IDOMNode = new DOMNode('subnode1');
			const subnode2 : IDOMNode = new DOMNode('subnode1');
			const subnode3 : IDOMNode = new DOMNode('subnode4');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
									
			const result : Vector.<IDOMNode> = document.select('node1/subnode1(@name=="subnode1")');
			assertEquals('Result length should be 3', 3, result.length);
		}
		
		[Test]
		public function path_select_subnode1_and_attribute_name_equals_subnode1_in_context() : void
		{
			const node0 : IDOMNode = new DOMNode('node0');
			const node1 : IDOMNode = new DOMNode('node1');
			const node2 : IDOMNode = new DOMNode('node1');
			
			const subnode0 : IDOMNode = new DOMNode('subnode1');
			const subnode1 : IDOMNode = new DOMNode('subnode1');
			const subnode2 : IDOMNode = new DOMNode('subnode1');
			const subnode3 : IDOMNode = new DOMNode('subnode4');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
									
			const result : Vector.<IDOMNode> = document.select('/node1/subnode1(@name=="subnode1")');
			assertEquals('Result length should be 3', 3, result.length);
		}
		
		[Test]
		public function path_select_subnode1_and_attribute_name_equals_subnode1_in_document() : void
		{
			const node0 : IDOMNode = new DOMNode('node0');
			const node1 : IDOMNode = new DOMNode('node1');
			const node2 : IDOMNode = new DOMNode('node1');
			
			const subnode0 : IDOMNode = new DOMNode('subnode1');
			const subnode1 : IDOMNode = new DOMNode('subnode1');
			const subnode2 : IDOMNode = new DOMNode('subnode1');
			const subnode3 : IDOMNode = new DOMNode('subnode4');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
									
			const result : Vector.<IDOMNode> = document.select('//node1/subnode1(@name=="subnode1")');
			assertEquals('Result length should be 3', 3, result.length);
		}
		
		[Test]
		public function path_select_subsubnode1_and_attribute_name_equals_subnode1() : void
		{
			const node0 : IDOMNode = new DOMNode('node0');
			const node1 : IDOMNode = new DOMNode('node1');
			const node2 : IDOMNode = new DOMNode('node1');
			
			const subnode0 : IDOMNode = new DOMNode('subnode1');
			const subnode1 : IDOMNode = new DOMNode('subnode1');
			const subnode2 : IDOMNode = new DOMNode('subnode1');
			const subnode3 : IDOMNode = new DOMNode('subnode4');
			
			const subsubnode0 : IDOMNode = new DOMNode('subsubnode1');
			const subsubnode1 : IDOMNode = new DOMNode('subsubnode1');
			const subsubnode2 : IDOMNode = new DOMNode('subsubnode2');
			const subsubnode3 : IDOMNode = new DOMNode('subsubnode3');
			const subsubnode4 : IDOMNode = new DOMNode('subsubnode1');
			const subsubnode5 : IDOMNode = new DOMNode('subsubnode1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			
			subnode1.add(subsubnode0);
			subnode1.add(subsubnode1);
			subnode1.add(subsubnode2);
			
			subnode2.add(subsubnode3);
			subnode2.add(subsubnode4);
			subnode2.add(subsubnode5);
									
			const result : Vector.<IDOMNode> = document.select('node1/subnode1/subsubnode1(@name=="subsubnode1")');
			assertEquals('Result length should be 4', 4, result.length);
		}
		
		[Test]
		public function path_select_subsubnode1_and_attribute_name_equals_subnode1_in_context() : void
		{
			const node0 : IDOMNode = new DOMNode('node0');
			const node1 : IDOMNode = new DOMNode('node1');
			const node2 : IDOMNode = new DOMNode('node1');
			
			const subnode0 : IDOMNode = new DOMNode('subnode1');
			const subnode1 : IDOMNode = new DOMNode('subnode1');
			const subnode2 : IDOMNode = new DOMNode('subnode1');
			const subnode3 : IDOMNode = new DOMNode('subnode4');
			
			const subsubnode0 : IDOMNode = new DOMNode('subsubnode1');
			const subsubnode1 : IDOMNode = new DOMNode('subsubnode1');
			const subsubnode2 : IDOMNode = new DOMNode('subsubnode2');
			const subsubnode3 : IDOMNode = new DOMNode('subsubnode3');
			const subsubnode4 : IDOMNode = new DOMNode('subsubnode1');
			const subsubnode5 : IDOMNode = new DOMNode('subsubnode1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			
			subnode1.add(subsubnode0);
			subnode1.add(subsubnode1);
			subnode1.add(subsubnode2);
			
			subnode2.add(subsubnode3);
			subnode2.add(subsubnode4);
			subnode2.add(subsubnode5);
									
			const result : Vector.<IDOMNode> = document.select('/node1/subnode1/subsubnode1(@name=="subsubnode1")');
			assertEquals('Result length should be 4', 4, result.length);
		}
		
		[Test]
		public function path_select_subsubnode1_and_attribute_name_equals_subnode1_in_document() : void
		{
			const node0 : IDOMNode = new DOMNode('node0');
			const node1 : IDOMNode = new DOMNode('node1');
			const node2 : IDOMNode = new DOMNode('node1');
			
			const subnode0 : IDOMNode = new DOMNode('subnode1');
			const subnode1 : IDOMNode = new DOMNode('subnode1');
			const subnode2 : IDOMNode = new DOMNode('subnode1');
			const subnode3 : IDOMNode = new DOMNode('subnode4');
			
			const subsubnode0 : IDOMNode = new DOMNode('subsubnode1');
			const subsubnode1 : IDOMNode = new DOMNode('subsubnode1');
			const subsubnode2 : IDOMNode = new DOMNode('subsubnode2');
			const subsubnode3 : IDOMNode = new DOMNode('subsubnode3');
			const subsubnode4 : IDOMNode = new DOMNode('subsubnode1');
			const subsubnode5 : IDOMNode = new DOMNode('subsubnode1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			
			subnode1.add(subsubnode0);
			subnode1.add(subsubnode1);
			subnode1.add(subsubnode2);
			
			subnode2.add(subsubnode3);
			subnode2.add(subsubnode4);
			subnode2.add(subsubnode5);
									
			const result : Vector.<IDOMNode> = document.select('//node1/subnode1/subsubnode1(@name=="subsubnode1")');
			assertEquals('Result length should be 4', 4, result.length);
		}
	}
}
