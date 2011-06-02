package org.osflash.dom.path
{
	import asunit.asserts.assertEquals;
	import asunit.asserts.assertEqualsArraysIgnoringOrder;

	import org.osflash.dom.element.DOMDocument;
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.support.DOMConditionalNode;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathLogicalAndTest
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
		public function path_select_node1_and_check_name_equals_node1_and_value_equals_value1() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('node1.(@name=="node1" && @value=="value1")');
			assertEquals('Result length should be 2', 2, result.length);
			assertEqualsArraysIgnoringOrder('Results should be',
																[node4, node5],
																[result[0], result[1]]
																);
		}
		
		[Test]
		public function path_select_node1_and_check_name_equals_node1_and_value_equals_value1_in_context() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('/node1.(@name=="node1" && @value=="value1")');
			assertEquals('Result length should be 2', 2, result.length);
			assertEqualsArraysIgnoringOrder('Results should be',
																[node4, node5],
																[result[0], result[1]]
																);
		}
		
		[Test]
		public function path_select_node1_and_check_name_equals_node1_and_value_equals_value1_in_document() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('//node1.(@name=="node1" && @value=="value1")');
			assertEquals('Result length should be 2', 2, result.length);
			assertEqualsArraysIgnoringOrder('Results should be',
																[node4, node5],
																[result[0], result[1]]
																);
		}
		
		[Test]
		public function path_select_node1_and_check_name_equals_node1_and_value_equals_value2() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('node1.(@name=="node1" && @value=="value2")');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_node1_and_check_name_equals_node1_and_value_equals_value2_in_context() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('/node1.(@name=="node1" && @value=="value2")');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_node1_and_check_name_equals_node1_and_value_equals_value2_in_document() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('//node1.(@name=="node1" && @value=="value2")');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_node1_and_check_name_equals_node1_and_value_equals_value0_and_value1() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('node1.(@name=="node1" && @value=="value0" && @value=="value1")');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_node1_and_check_name_equals_node1_and_value_equals_value0_and_value1_in_context() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('/node1.(@name=="node1" && @value=="value0" && @value=="value1")');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_node1_and_check_name_equals_node1_and_value_equals_value0_and_value1_in_document() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('//node1.(@name=="node1" && @value=="value0" && @value=="value1")');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_node1_and_check_name_equals_node1_and_index_equals_0_value_equals_value2() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('node1.(@name=="node1" && @index==0 && @value=="value2")');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_node1_and_check_name_equals_node1_and_index_equals_0_value_equals_value2_in_context() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('/node1.(@name=="node1" && @index==0 && @value=="value2")');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_node1_and_check_name_equals_node1_and_index_equals_0_value_equals_value2_in_document() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('//node1.(@name=="node1" && @index==0 && @value=="value2")');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_node1_and_check_name_equals_node1_and_index_equals_5_value_equals_value2() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('node1.(@name=="node1" && @index==5 && @value=="value1")');
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should be node5', node5, result[0]);
		}
		
		[Test]
		public function path_select_node1_and_check_name_equals_node1_and_index_equals_5_value_equals_value2_in_context() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('/node1.(@name=="node1" && @index==5 && @value=="value1")');
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should be node5', node5, result[0]);
		}
		
		[Test]
		public function path_select_node1_and_check_name_equals_node1_and_index_equals_5_value_equals_value2_in_document() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
									
			const result : Vector.<IDOMNode> = document.select('//node1.(@name=="node1" && @index==5 && @value=="value1")');
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should be node5', node5, result[0]);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_and_check_name_equals_subnode1_and_value_equals_value0() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			const subnode0 : IDOMNode = new DOMConditionalNode('subnode0', "value0");
			const subnode1 : IDOMNode = new DOMConditionalNode('subnode0', "value1");
			
			const subnode2 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode3 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode4 : IDOMNode = new DOMConditionalNode('subnode2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
			
			node0.add(subnode0);
			node0.add(subnode1);
			
			node2.add(subnode2);
			node2.add(subnode3);
			node2.add(subnode4);
									
			const result : Vector.<IDOMNode> = document.select('node1/subnode1.(@name=="subnode1" && @value=="value0")');
			assertEquals('Result length should be 2', 2, result.length);
			assertEqualsArraysIgnoringOrder('Results should be',
																[subnode2, subnode3],
																[result[0], result[1]]
																);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_and_check_name_equals_subnode1_and_value_equals_value0_in_context() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			const subnode0 : IDOMNode = new DOMConditionalNode('subnode0', "value0");
			const subnode1 : IDOMNode = new DOMConditionalNode('subnode0', "value1");
			
			const subnode2 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode3 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode4 : IDOMNode = new DOMConditionalNode('subnode2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
			
			node0.add(subnode0);
			node0.add(subnode1);
			
			node2.add(subnode2);
			node2.add(subnode3);
			node2.add(subnode4);
									
			const result : Vector.<IDOMNode> = document.select('/node1/subnode1.(@name=="subnode1" && @value=="value0")');
			assertEquals('Result length should be 2', 2, result.length);
			assertEqualsArraysIgnoringOrder('Results should be',
																[subnode2, subnode3],
																[result[0], result[1]]
																);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_and_check_name_equals_subnode1_and_value_equals_value0_in_document() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			const subnode0 : IDOMNode = new DOMConditionalNode('subnode0', "value0");
			const subnode1 : IDOMNode = new DOMConditionalNode('subnode0', "value1");
			
			const subnode2 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode3 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode4 : IDOMNode = new DOMConditionalNode('subnode2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
			
			node0.add(subnode0);
			node0.add(subnode1);
			
			node2.add(subnode2);
			node2.add(subnode3);
			node2.add(subnode4);
									
			const result : Vector.<IDOMNode> = document.select('//node1/subnode1.(@name=="subnode1" && @value=="value0")');
			assertEquals('Result length should be 2', 2, result.length);
			assertEqualsArraysIgnoringOrder('Results should be',
																[subnode2, subnode3],
																[result[0], result[1]]
																);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_and_check_name_equals_subnode1_and_value_equals_value2() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			const subnode0 : IDOMNode = new DOMConditionalNode('subnode0', "value0");
			const subnode1 : IDOMNode = new DOMConditionalNode('subnode0', "value1");
			
			const subnode2 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode3 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode4 : IDOMNode = new DOMConditionalNode('subnode2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
			
			node0.add(subnode0);
			node0.add(subnode1);
			
			node2.add(subnode2);
			node2.add(subnode3);
			node2.add(subnode4);
									
			const result : Vector.<IDOMNode> = document.select('node1/subnode1.(@name=="subnode1" && @value=="value2")');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_and_check_name_equals_subnode1_and_value_equals_value2_in_context() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			const subnode0 : IDOMNode = new DOMConditionalNode('subnode0', "value0");
			const subnode1 : IDOMNode = new DOMConditionalNode('subnode0', "value1");
			
			const subnode2 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode3 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode4 : IDOMNode = new DOMConditionalNode('subnode2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
			
			node0.add(subnode0);
			node0.add(subnode1);
			
			node2.add(subnode2);
			node2.add(subnode3);
			node2.add(subnode4);
									
			const result : Vector.<IDOMNode> = document.select('/node1/subnode1.(@name=="subnode1" && @value=="value2")');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_and_check_name_equals_subnode1_and_value_equals_value2_in_document() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			const subnode0 : IDOMNode = new DOMConditionalNode('subnode0', "value0");
			const subnode1 : IDOMNode = new DOMConditionalNode('subnode0', "value1");
			
			const subnode2 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode3 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode4 : IDOMNode = new DOMConditionalNode('subnode2', "value1");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
			
			node0.add(subnode0);
			node0.add(subnode1);
			
			node2.add(subnode2);
			node2.add(subnode3);
			node2.add(subnode4);
									
			const result : Vector.<IDOMNode> = document.select('//node1/subnode1.(@name=="subnode1" && @value=="value2")');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_then_subsubnode2_and_check_name_equals_subnode1_and_value_equals_value2() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			const subnode0 : IDOMNode = new DOMConditionalNode('subnode0', "value0");
			const subnode1 : IDOMNode = new DOMConditionalNode('subnode0', "value1");
			
			const subnode2 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode3 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode4 : IDOMNode = new DOMConditionalNode('subnode2', "value1");
			
			const subsubnode0 : IDOMNode = new DOMConditionalNode('subsubnode0', "value0");
			const subsubnode1 : IDOMNode = new DOMConditionalNode('subsubnode0', "value1");
			const subsubnode2 : IDOMNode = new DOMConditionalNode('subsubnode1', "value0");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
			
			node0.add(subnode0);
			node0.add(subnode1);
			
			node2.add(subnode2);
			node2.add(subnode3);
			node2.add(subnode4);
			
			subnode1.add(subsubnode0);
			subnode1.add(subsubnode1);
			subnode1.add(subsubnode2);
									
			const result : Vector.<IDOMNode> = document.select('node1/subnode1/subsubnode1.(@name=="subsubnode1" && @value=="value0")');
			assertEquals('Result length should be 1', 1, result.length);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_then_subsubnode2_and_check_name_equals_subnode1_and_value_equals_value2_in_context() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			const subnode0 : IDOMNode = new DOMConditionalNode('subnode0', "value0");
			const subnode1 : IDOMNode = new DOMConditionalNode('subnode0', "value1");
			
			const subnode2 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode3 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode4 : IDOMNode = new DOMConditionalNode('subnode2', "value1");
			
			const subsubnode0 : IDOMNode = new DOMConditionalNode('subsubnode0', "value0");
			const subsubnode1 : IDOMNode = new DOMConditionalNode('subsubnode0', "value1");
			const subsubnode2 : IDOMNode = new DOMConditionalNode('subsubnode1', "value0");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
			
			node0.add(subnode0);
			node0.add(subnode1);
			
			node2.add(subnode2);
			node2.add(subnode3);
			node2.add(subnode4);
			
			subnode1.add(subsubnode0);
			subnode1.add(subsubnode1);
			subnode1.add(subsubnode2);
									
			const result : Vector.<IDOMNode> = document.select('/node1/subnode1/subsubnode1.(@name=="subsubnode1" && @value=="value0")');
			assertEquals('Result length should be 1', 1, result.length);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_then_subsubnode2_and_check_name_equals_subnode1_and_value_equals_value2_in_document() : void
		{
			const node0 : IDOMNode = new DOMConditionalNode('node0', "value0");
			const node1 : IDOMNode = new DOMConditionalNode('node0', "value1");
			
			const node2 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node3 : IDOMNode = new DOMConditionalNode('node1', "value0");
			const node4 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node5 : IDOMNode = new DOMConditionalNode('node1', "value1");
			const node6 : IDOMNode = new DOMConditionalNode('node1', "value0");
			
			const node7 : IDOMNode = new DOMConditionalNode('node2', "value1");
			const node8 : IDOMNode = new DOMConditionalNode('node2', "value1");
			
			const subnode0 : IDOMNode = new DOMConditionalNode('subnode0', "value0");
			const subnode1 : IDOMNode = new DOMConditionalNode('subnode0', "value1");
			
			const subnode2 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode3 : IDOMNode = new DOMConditionalNode('subnode1', "value0");
			const subnode4 : IDOMNode = new DOMConditionalNode('subnode2', "value1");
			
			const subsubnode0 : IDOMNode = new DOMConditionalNode('subsubnode0', "value0");
			const subsubnode1 : IDOMNode = new DOMConditionalNode('subsubnode0', "value1");
			const subsubnode2 : IDOMNode = new DOMConditionalNode('subsubnode1', "value0");
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			document.add(node3);
			document.add(node4);
			document.add(node5);
			document.add(node6);
			document.add(node7);
			document.add(node8);
			
			node0.add(subnode0);
			node0.add(subnode1);
			
			node2.add(subnode2);
			node2.add(subnode3);
			node2.add(subnode4);
			
			subnode1.add(subsubnode0);
			subnode1.add(subsubnode1);
			subnode1.add(subsubnode2);
									
			const result : Vector.<IDOMNode> = document.select('//node1/subnode1/subsubnode1.(@name=="subsubnode1" && @value=="value0")');
			assertEquals('Result length should be 1', 1, result.length);
		}
	}
}
