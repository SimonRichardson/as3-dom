package org.osflash.dom.path
{
	import asunit.asserts.assertEquals;
	import asunit.asserts.assertEqualsArraysIgnoringOrder;

	import org.osflash.dom.element.DOMDocument;
	import org.osflash.dom.element.DOMNode;
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.support.DOMConditionalNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathWildcardEqualityTest
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
		public function path_select_all_and_attribute_name_equals_node1() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', 'node0');
			const node1 : IDOMNode = new DOMConditionalNode('node1', 'node1');
			const node2 : IDOMNode = new DOMConditionalNode('node1', 'node2');
			const node3 : IDOMNode = new DOMConditionalNode('node1', 'node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
									
			const result : Vector.<IDOMNode> = document.select('*.(@value=="node1")');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function path_select_all_and_attribute_name_equals_node1_in_context() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', 'node0');
			const node1 : IDOMNode = new DOMConditionalNode('node1', 'node1');
			const node2 : IDOMNode = new DOMConditionalNode('node1', 'node2');
			const node3 : IDOMNode = new DOMConditionalNode('node1', 'node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
									
			const result : Vector.<IDOMNode> = document.select('/*.(@value=="node1")');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function path_select_all_and_attribute_name_equals_node1_in_document() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', 'node0');
			const node1 : IDOMNode = new DOMConditionalNode('node1', 'node1');
			const node2 : IDOMNode = new DOMConditionalNode('node1', 'node2');
			const node3 : IDOMNode = new DOMConditionalNode('node1', 'node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
									
			const result : Vector.<IDOMNode> = document.select('//*.(@value=="node1")');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function path_select_all_and_attribute_name_equals_subnode1() : void
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
			
			node2.add(subnode2);
			
			node1.add(subnode3);
									
			const result : Vector.<IDOMNode> = document.select('node1/*.(@name=="subnode1")');
			assertEquals('Result length should be 3', 3, result.length);
			assertEqualsArraysIgnoringOrder('Result should be',
															[subnode0, subnode1, subnode2],
															[result[0], result[1], result[2]]
															);
		}
		
		[Test]
		public function path_select_all_and_attribute_name_equals_all_in_context() : void
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
			
			node2.add(subnode2);
			
			node1.add(subnode3);
									
			const result : Vector.<IDOMNode> = document.select('/node1/*.(@name=="subnode1")');
			assertEquals('Result length should be 3', 3, result.length);
			assertEqualsArraysIgnoringOrder('Result should be',
															[subnode0, subnode1, subnode2],
															[result[0], result[1], result[2]]
															);
		}
		
		[Test]
		public function path_select_all_and_attribute_name_equals_all_in_document() : void
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
			
			node2.add(subnode2);
			
			node1.add(subnode3);
									
			const result : Vector.<IDOMNode> = document.select('//node1/*.(@name=="subnode1")');
			assertEquals('Result length should be 3', 3, result.length);
			assertEqualsArraysIgnoringOrder('Result should be',
															[subnode0, subnode1, subnode2],
															[result[0], result[1], result[2]]
															);
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
									
			const result : Vector.<IDOMNode> = document.select('node1/subnode1/*.(@name=="subsubnode1")');
			assertEquals('Result length should be 4', 4, result.length);
		}
		
		[Test]
		public function path_select_subsubnode1_and_attribute_name_equals_all_in_context() : void
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
									
			const result : Vector.<IDOMNode> = document.select('/node1/subnode1/*.(@name=="subsubnode1")');
			assertEquals('Result length should be 4', 4, result.length);
		}
		
		[Test]
		public function path_select_subsubnode1_and_attribute_name_equals_all_in_document() : void
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
									
			const result : Vector.<IDOMNode> = document.select('//node1/subnode1/*.(@name=="subsubnode1")');
			assertEquals('Result length should be 4', 4, result.length);
		}
	}
}
