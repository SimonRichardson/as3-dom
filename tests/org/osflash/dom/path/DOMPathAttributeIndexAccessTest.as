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
	public class DOMPathAttributeIndexAccessTest
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
		
		[Tester]
		public function path_select_all_with_attribute_name() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			document.add(node0);
			document.add(node1);
									
			const result : Vector.<IDOMNode> = document.select('@name[1]');
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain node1', node1, result[0]);
		}
		
		[Tester]
		public function path_select_all_with_attribute_name_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			document.add(node0);
			document.add(node1);
									
			const result : Vector.<IDOMNode> = document.select('/@name[1]');
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain node1', node1, result[0]);
		}
		
		[Tester]
		public function path_select_all_with_attribute_name_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			document.add(node0);
			document.add(node1);
									
			const result : Vector.<IDOMNode> = document.select('//@name[1]');
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain node1', node1, result[0]);
		}
	}
}
