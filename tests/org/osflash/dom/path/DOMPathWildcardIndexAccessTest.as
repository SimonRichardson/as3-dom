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
		
	}
}
