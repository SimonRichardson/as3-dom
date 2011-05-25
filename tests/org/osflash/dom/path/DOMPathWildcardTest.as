package org.osflash.dom.path
{
	import asunit.asserts.assertEquals;
	import asunit.asserts.assertEqualsArraysIgnoringOrder;

	import org.osflash.dom.element.DOMDocument;
	import org.osflash.dom.element.DOMNode;
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.IDOMNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathWildcardTest
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
		public function add_elements_and_path_select_all_element_nodes() : void
		{
			const node : DOMNode = new DOMNode('node');
			
			document.add(node);
			
			const result : Vector.<IDOMNode> = document.select('*');
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result item at 0 index should be same as initial node', node, result[0]);
		}
		
		[Test]
		public function add_elements_and_path_select_all_documents_nodes() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			const subsubnode1 : DOMNode = new DOMNode('subsubnode1');
			const subsubnode2 : DOMNode = new DOMNode('subsubnode2');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
			
			subnode1.add(subsubnode1);
			subnode1.add(subsubnode2);
			
			const result : Vector.<IDOMNode> = document.select('//*');
			
			assertEquals('Result length should be 7', 7, result.length);
		}
		
		[Test]
		public function add_elements_and_path_select_documents_nodes() : void
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
						
			const result : Vector.<IDOMNode> = document.select('/*');
			
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function add_elements_and_path_select_node1_children() : void
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
						
			const result : Vector.<IDOMNode> = document.select('node1/*');
			
			assertEquals('Result length should be 2', 2, result.length);
			assertEqualsArraysIgnoringOrder('Result should contain subnode0 and subnode1',
																			[subnode0, subnode1],
																			[result[0], result[1]]
																			);
		}
	}
}
