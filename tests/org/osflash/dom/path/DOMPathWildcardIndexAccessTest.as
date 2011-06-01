package org.osflash.dom.path
{
	import asunit.asserts.assertEquals;

	import org.osflash.dom.element.DOMDocument;
	import org.osflash.dom.element.DOMNode;
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.IDOMNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathWildcardIndexAccessTest
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
		public function add_elements_and_path_select_all_at_index0() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMNode = new DOMNode('node1');
			
			document.add(node0);
			document.add(node1);
			
			const result : Vector.<IDOMNode> = document.select('*[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result item at 0 index should be same as node0', node0, result[0]);
		}
		
		[Test]
		public function add_elements_and_path_select_all_at_index0_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMNode = new DOMNode('node1');
			
			document.add(node0);
			document.add(node1);
			
			const result : Vector.<IDOMNode> = document.select('/*[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result item at 0 index should be same as node0', node0, result[0]);
		}
		
		[Test]
		public function add_elements_and_path_select_all_at_index0_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMNode = new DOMNode('node1');
			
			document.add(node0);
			document.add(node1);
			
			const result : Vector.<IDOMNode> = document.select('//*[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result item at 0 index should be same as node0', node0, result[0]);
		}
		
		[Test]
		public function add_elements_and_path_select_node1_child0() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('node1/*[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result item at 0 index should be same as subnode0', subnode0, result[0]);
		}
		
		[Test]
		public function add_elements_and_path_select_node1_child0_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('/node1/*[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result item at 0 index should be same as subnode0', subnode0, result[0]);
		}
		
		[Test]
		public function add_elements_and_path_select_node1_child0_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node1/*[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result item at 0 index should be same as subnode0', subnode0, result[0]);
		}
		
		[Test]
		public function add_elements_and_path_select_grandchild1() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			const subnode2 : DOMNode = new DOMNode('subnode2');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			node1.add(subnode2);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('*/*[1]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result item at 0 index should be same as subnode1', subnode1, result[0]);
		}
		
		[Test]
		public function add_elements_and_path_select_grandchild1_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			const subnode2 : DOMNode = new DOMNode('subnode2');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			node1.add(subnode2);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('/*/*[1]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result item at 0 index should be same as subnode1', subnode1, result[0]);
		}
		
		[Test]
		public function add_elements_and_path_select_grandchild1_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			const subnode2 : DOMNode = new DOMNode('subnode2');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			node1.add(subnode2);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//*/*[1]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result item at 0 index should be same as subnode1', subnode1, result[0]);
		}
	}
}
