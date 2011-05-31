package org.osflash.dom.path
{
	import asunit.asserts.assertEqualsArraysIgnoringOrder;
	import asunit.asserts.assertEquals;

	import org.osflash.dom.element.DOMDocument;
	import org.osflash.dom.element.DOMNode;
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.IDOMNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathNameTest
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
		public function add_elements_and_path_select_node1() : void
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
						
			const result : Vector.<IDOMNode> = document.select('node1');
			
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function add_elements_and_path_select_node1_in_context() : void
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
						
			const result : Vector.<IDOMNode> = document.select('/node1');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result item at 0 index should be same as node1', node1, result[0]);
		}
		
		[Test]
		public function add_elements_and_path_select_multiple_nodes_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node');
			const node1 : DOMNode = new DOMNode('node');
			
			const subnode0 : DOMNode = new DOMNode('subnode');
			const subnode1 : DOMNode = new DOMNode('node');
			
			const subsubnode0 : DOMNode = new DOMNode('node');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node');
			
			assertEquals('Result length should be 4', 4, result.length);
		}
		
		[Test]
		public function add_elements_and_path_select_node1_then_subnode0() : void
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
						
			const result : Vector.<IDOMNode> = document.select('node1/subnode0');
			
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function add_elements_and_path_select_node1_then_subnode0_in_context() : void
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
						
			const result : Vector.<IDOMNode> = document.select('/node1/subnode0');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result item at 0 index should be same as subnode0', subnode0, result[0]);
		}
		
		[Test]
		public function add_elements_and_path_select_node1_then_subnode0_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMNode = new DOMNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			const subnode2 : DOMNode = new DOMNode('subnode0');
			const subnode3 : DOMNode = new DOMNode('subnode0');
			const subnode4 : DOMNode = new DOMNode('subnode2');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node0.add(subnode0);
			node0.add(subnode1);
			
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node1/subnode0');
			
			assertEquals('Result length should be 3', 3, result.length);
			assertEquals('Result item at 0 index should be same as subnode0', subnode0, result[0]);
		}
		
		[Test]
		public function add_elements_and_path_select_node1_then_subnode0_then_subsubnode0() : void
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
						
			const result : Vector.<IDOMNode> = document.select('node1/subnode0/subsubnode0');
			
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function add_elements_and_path_select_node1_then_subnode0_then_subsubnode0_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			const subsubnode1 : DOMNode = new DOMNode('subsubnode0');
			const subsubnode2 : DOMNode = new DOMNode('subsubnode1');
			const subsubnode3 : DOMNode = new DOMNode('subsubnode0');
			const subsubnode4 : DOMNode = new DOMNode('subsubnode2');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
			subnode0.add(subsubnode1);
			subnode0.add(subsubnode2);
			
			subnode1.add(subsubnode3);
			subnode1.add(subsubnode4);
						
			const result : Vector.<IDOMNode> = document.select('/node1/subnode0/subsubnode0');
			
			assertEquals('Result length should be 3', 3, result.length);
			assertEqualsArraysIgnoringOrder('Result item should be same as ', 
															[subsubnode0, subsubnode1, subsubnode3],
															[result[0], result[1], result[2]]
															);
		}
		
		[Test]
		public function add_elements_and_path_select_subnode1_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			const node2 : DOMNode = new DOMNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode1');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			const subnode2 : DOMNode = new DOMNode('subnode1');
			const subnode3 : DOMNode = new DOMNode('subnode4');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('/node1/subnode1');
			
			assertEquals('Result length should be 3', 3, result.length);
			assertEqualsArraysIgnoringOrder('Result should be same as', 
																[subnode0, subnode1, subnode2], 
																[result[0], result[1], result[2]]
																);
		}
		
		[Test]
		public function add_elements_and_path_select_subnode1_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			const node2 : DOMNode = new DOMNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode1');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			const subnode2 : DOMNode = new DOMNode('subnode1');
			const subnode3 : DOMNode = new DOMNode('subnode4');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node1/subnode1');
			
			assertEquals('Result length should be 3', 3, result.length);
			assertEqualsArraysIgnoringOrder('Result should be same as', 
																[subnode0, subnode1, subnode2], 
																[result[0], result[1], result[2]]
																);
		}
		
		[Test]
		public function add_elements_and_path_select_node1_subnode1_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			const node2 : DOMNode = new DOMNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode1');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			const subnode2 : DOMNode = new DOMNode('subnode1');
			const subnode3 : DOMNode = new DOMNode('subnode4');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			node2.add(subnode2);
			
			node1.add(subnode3);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('/node1/subnode1');
			
			assertEquals('Result length should be 3', 3, result.length);
			assertEqualsArraysIgnoringOrder('Result should be same as', 
																[subnode0, subnode1, subnode2], 
																[result[0], result[1], result[2]]
																);
		}
		
		[Test]
		public function add_elements_and_path_select_node1_subnode1_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			const node2 : DOMNode = new DOMNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode1');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			const subnode2 : DOMNode = new DOMNode('subnode1');
			const subnode3 : DOMNode = new DOMNode('subnode4');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			node2.add(subnode2);
			
			node1.add(subnode3);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node1/subnode1');
			
			assertEquals('Result length should be 3', 3, result.length);
			assertEqualsArraysIgnoringOrder('Result should be same as', 
																[subnode0, subnode1, subnode2], 
																[result[0], result[1], result[2]]
																);
		}
	}
}
