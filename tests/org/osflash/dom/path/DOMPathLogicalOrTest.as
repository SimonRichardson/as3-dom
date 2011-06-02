package org.osflash.dom.path
{
	import asunit.asserts.assertEquals;
	import asunit.asserts.assertEqualsArraysIgnoringOrder;

	import org.osflash.dom.element.DOMDocument;
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.support.DOMConditionalNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathLogicalOrTest
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
		public function path_select_node1_and_check_index_equals_2_or_value_equals_value1() : void
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
									
			const result : Vector.<IDOMNode> = document.select('node1.(@index==2 || @value=="value1")');
			assertEquals('Result length should be 3', 3, result.length);
			assertEqualsArraysIgnoringOrder('Results should be',
																[node2, node4, node5],
																[result[0], result[1], result[2]]
																);
		}
	}
}
