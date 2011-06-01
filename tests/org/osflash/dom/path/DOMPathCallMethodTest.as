package org.osflash.dom.path
{
	import asunit.asserts.assertEquals;
	import asunit.asserts.assertEqualsArraysIgnoringOrder;

	import org.osflash.dom.element.DOMDocument;
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.support.DOMCallMethodNode;
	/**
	 * .author Simon Richardson - simon.ustwo.co.uk
	 */
	public class DOMPathCallMethodTest
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
		public function path_select_node1_call_method_no_arg() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node0');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			const node2 : IDOMNode = new DOMCallMethodNode('node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
									
			const result : Vector.<IDOMNode> = document.select('node1.methodNoArg()');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function path_select_node1_call_method_no_arg_in_context() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node0');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			const node2 : IDOMNode = new DOMCallMethodNode('node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
									
			const result : Vector.<IDOMNode> = document.select('/node1.methodNoArg()');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function path_select_node1_call_method_no_arg_in_dom() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node0');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			const node2 : IDOMNode = new DOMCallMethodNode('node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
									
			const result : Vector.<IDOMNode> = document.select('//node1.methodNoArg()');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function path_select_node1_call_method_with_string_arg() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node0');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			const node2 : IDOMNode = new DOMCallMethodNode('node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
									
			const result : Vector.<IDOMNode> = document.select('node1.methodWithStringArg("hello")');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function path_select_node1_call_method_with_string_arg_in_context() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node0');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			const node2 : IDOMNode = new DOMCallMethodNode('node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
									
			const result : Vector.<IDOMNode> = document.select('/node1.methodWithStringArg("hello")');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function path_select_node1_call_method_with_string_arg_in_dom() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node0');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			const node2 : IDOMNode = new DOMCallMethodNode('node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
									
			const result : Vector.<IDOMNode> = document.select('//node1.methodWithStringArg("hello")');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function path_select_node1_call_method_with_multiple_arg() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node0');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			const node2 : IDOMNode = new DOMCallMethodNode('node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
									
			const result : Vector.<IDOMNode> = document.select('node1.methodWithMultipleArg("hello", 1, "duffus", -8, 0.2)');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_call_method_no_arg() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode0');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
			
			const result : Vector.<IDOMNode> = document.select('node1/subnode1.methodWithNoArg()');
			assertEquals('Result length should be 1', 1, result.length);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_call_method_no_arg_in_context() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode0');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
			
			const result : Vector.<IDOMNode> = document.select('/node1/subnode1.methodWithNoArg()');
			assertEquals('Result length should be 1', 1, result.length);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_call_method_no_arg_in_document() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode0');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
			
			const result : Vector.<IDOMNode> = document.select('//node1/subnode1.methodWithNoArg()');
			assertEquals('Result length should be 1', 1, result.length);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_call_method_string_arg() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode0');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			
			const result : Vector.<IDOMNode> = document.select('node1/subnode1.methodWithStringArg("Sub hello")');
			assertEquals('Result length should be 3', 3, result.length);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_call_method_string_arg_in_context() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode0');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			
			const result : Vector.<IDOMNode> = document.select('/node1/subnode1.methodWithStringArg("Sub hello")');
			assertEquals('Result length should be 3', 3, result.length);
		}
		
		[Test]
		public function path_select_node1_then_subnode1_call_method_string_arg_in_document() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode0');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			
			const result : Vector.<IDOMNode> = document.select('//node1/subnode1.methodWithStringArg("Sub hello")');
			assertEquals('Result length should be 3', 3, result.length);
		}
		
		[Test]
		public function path_select_node1_with_index1_then_subnode1_call_method_no_arg() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode1', '>');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node0.add(subnode0);
			
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			
			const result : Vector.<IDOMNode> = document.select('node1[1]/subnode1.methodWithNoArg()');
			assertEquals('Result length should be 3', 3, result.length);
		}
		
		[Test]
		public function path_select_node1_with_index1_then_subnode1_call_method_no_arg_in_context() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode1', '>');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node0.add(subnode0);
			
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			
			const result : Vector.<IDOMNode> = document.select('/node1[1]/subnode1.methodWithNoArg()');
			assertEquals('Result length should be 3', 3, result.length);
		}
		
		[Test]
		public function path_select_node1_with_index1_then_subnode1_call_method_no_arg_in_document() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode1', '>');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node0.add(subnode0);
			
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			
			const result : Vector.<IDOMNode> = document.select('//node1[1]/subnode1.methodWithNoArg()');
			assertEquals('Result length should be 3', 3, result.length);
		}
		
		[Test]
		public function path_select_node1_with_index1_then_subnode1_call_method_string_arg() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode1', '>');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node0.add(subnode0);
			
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			
			const result : Vector.<IDOMNode> = document.select('node1[1]/subnode1.methodWithStringArg("Sub hello")');
			assertEquals('Result length should be 3', 3, result.length);
		}
		
		[Test]
		public function path_select_node1_with_index1_then_subnode1_call_method_string_arg_in_context() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode1', '>');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node0.add(subnode0);
			
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			
			const result : Vector.<IDOMNode> = document.select('/node1[1]/subnode1.methodWithStringArg("Sub hello")');
			assertEquals('Result length should be 3', 3, result.length);
		}
		
		[Test]
		public function path_select_node1_with_index1_then_subnode1_call_method_string_arg_in_document() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode1', '>');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node0.add(subnode0);
			
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			
			const result : Vector.<IDOMNode> = document.select('//node1[1]/subnode1.methodWithStringArg("Sub hello")');
			assertEquals('Result length should be 3', 3, result.length);
		}
		
		[Test]
		public function path_select_subnode1_with_index1_then_subsubnode2_call_method_no_arg() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			const subsubnode1 : IDOMNode = new DOMCallMethodNode('subsubnode1');
			const subsubnode2 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			const subsubnode3 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			const subsubnode4 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			
			document.add(node0);
			document.add(node1);
			
			node0.add(subnode0);
			
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			subnode0.add(subsubnode1);
			subnode0.add(subsubnode2);
			
			subnode1.add(subsubnode3);
			subnode1.add(subsubnode4);
			
			const result : Vector.<IDOMNode> = document.select('node1[1]/subnode1[0]/subsubnode2.methodNoArg()');
			assertEquals('Result length should be 2', 2, result.length);
			assertEqualsArraysIgnoringOrder('Result length should include', 
																[subsubnode3, subsubnode4], 
																[result[0], result[1]]
																);
		}
		
		[Test]
		public function path_select_subnode1_with_index1_then_subsubnode2_call_method_no_arg_in_context() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			const subsubnode1 : IDOMNode = new DOMCallMethodNode('subsubnode1');
			const subsubnode2 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			const subsubnode3 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			const subsubnode4 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			
			document.add(node0);
			document.add(node1);
			
			node0.add(subnode0);
			
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			subnode0.add(subsubnode1);
			subnode0.add(subsubnode2);
			
			subnode1.add(subsubnode3);
			subnode1.add(subsubnode4);
			
			const result : Vector.<IDOMNode> = document.select('/node1[1]/subnode1[0]/subsubnode2.methodNoArg()');
			assertEquals('Result length should be 2', 2, result.length);
			assertEqualsArraysIgnoringOrder('Result length should include', 
																[subsubnode3, subsubnode4], 
																[result[0], result[1]]
																);
		}
		
		[Test]
		public function path_select_subnode1_with_index1_then_subsubnode2_call_method_no_arg_in_document() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			const subsubnode1 : IDOMNode = new DOMCallMethodNode('subsubnode1');
			const subsubnode2 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			const subsubnode3 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			const subsubnode4 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			
			document.add(node0);
			document.add(node1);
			
			node0.add(subnode0);
			
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			subnode0.add(subsubnode1);
			subnode0.add(subsubnode2);
			
			subnode1.add(subsubnode3);
			subnode1.add(subsubnode4);
			
			const result : Vector.<IDOMNode> = document.select('//node1[1]/subnode1[0]/subsubnode2.methodNoArg()');
			assertEquals('Result length should be 2', 2, result.length);
			assertEqualsArraysIgnoringOrder('Result length should include', 
																[subsubnode3, subsubnode4], 
																[result[0], result[1]]
																);
		}
		
		
		[Test]
		public function path_select_subnode1_with_index1_then_subsubnode2_call_method_string_arg() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			const subsubnode1 : IDOMNode = new DOMCallMethodNode('subsubnode1');
			const subsubnode2 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			const subsubnode3 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			const subsubnode4 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			
			document.add(node0);
			document.add(node1);
			
			node0.add(subnode0);
			
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			subnode0.add(subsubnode1);
			subnode0.add(subsubnode2);
			
			subnode1.add(subsubnode3);
			subnode1.add(subsubnode4);
			
			const result : Vector.<IDOMNode> = document.select('node1[1]/subnode1[0]/subsubnode2.methodWithStringArg("Hello subsubnode2")');
			assertEquals('Result length should be 2', 2, result.length);
			assertEqualsArraysIgnoringOrder('Result length should include', 
																[subsubnode3, subsubnode4], 
																[result[0], result[1]]
																);
		}
		
		[Test]
		public function path_select_subnode1_with_index1_then_subsubnode2_call_method_string_arg_in_context() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			const subsubnode1 : IDOMNode = new DOMCallMethodNode('subsubnode1');
			const subsubnode2 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			const subsubnode3 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			const subsubnode4 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			
			document.add(node0);
			document.add(node1);
			
			node0.add(subnode0);
			
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			subnode0.add(subsubnode1);
			subnode0.add(subsubnode2);
			
			subnode1.add(subsubnode3);
			subnode1.add(subsubnode4);
			
			const result : Vector.<IDOMNode> = document.select('/node1[1]/subnode1[0]/subsubnode2.methodWithStringArg("Hello subsubnode2")');
			assertEquals('Result length should be 2', 2, result.length);
			assertEqualsArraysIgnoringOrder('Result length should include', 
																[subsubnode3, subsubnode4], 
																[result[0], result[1]]
																);
		}
		
		[Test]
		public function path_select_subnode1_with_index1_then_subsubnode2_call_method_string_arg_in_document() : void
		{
			const node0 : IDOMNode = new DOMCallMethodNode('node1');
			const node1 : IDOMNode = new DOMCallMethodNode('node1');
			
			const subnode0 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode1 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode2 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode3 : IDOMNode = new DOMCallMethodNode('subnode1');
			const subnode4 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode5 : IDOMNode = new DOMCallMethodNode('subnode2');
			const subnode6 : IDOMNode = new DOMCallMethodNode('subnode3');
			
			const subsubnode0 : IDOMNode = new DOMCallMethodNode('subsubnode0');
			const subsubnode1 : IDOMNode = new DOMCallMethodNode('subsubnode1');
			const subsubnode2 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			const subsubnode3 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			const subsubnode4 : IDOMNode = new DOMCallMethodNode('subsubnode2');
			
			document.add(node0);
			document.add(node1);
			
			node0.add(subnode0);
			
			node1.add(subnode1);
			node1.add(subnode2);
			node1.add(subnode3);
			node1.add(subnode4);
			node1.add(subnode5);
			node1.add(subnode6);
			
			subnode0.add(subsubnode0);
			subnode0.add(subsubnode1);
			subnode0.add(subsubnode2);
			
			subnode1.add(subsubnode3);
			subnode1.add(subsubnode4);
			
			const result : Vector.<IDOMNode> = document.select('//node1[1]/subnode1[0]/subsubnode2.methodWithStringArg("Hello subsubnode2")');
			assertEquals('Result length should be 2', 2, result.length);
			assertEqualsArraysIgnoringOrder('Result length should include', 
																[subsubnode3, subsubnode4], 
																[result[0], result[1]]
																);
		}
	}
}
