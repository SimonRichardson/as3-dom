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
	}
}
