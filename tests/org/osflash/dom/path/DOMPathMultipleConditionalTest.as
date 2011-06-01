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
	public class DOMPathMultipleConditionalTest
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
									
			const result : Vector.<IDOMNode> = document.select('node1.(name!="node2" && name=="node1")');
			assertEquals('Result length should be 2', 2, result.length);
		}
	}
}
