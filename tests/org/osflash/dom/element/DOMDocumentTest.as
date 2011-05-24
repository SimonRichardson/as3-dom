package org.osflash.dom.element
{
	import asunit.asserts.assertEquals;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMDocumentTest
	{
		
		protected var document : IDOMDocument;
		
		[Before]
		public function setUp():void
		{
			document = new DOMDocument();
		}
		
		[After]
		public function tearDown():void
		{
			document = null;
		}
		
		[Test]
		public function add_elements_and_path_select_all_element_nodes() : void
		{
			const node : DOMNode = new DOMNode();
			
			document.add(node);
			
			const result : Vector.<IDOMNode> = document.select('*');
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result item at 0 index should be same as initial node', node, result[0]);
		}
		
		[Test]
		public function add_elements_and_path_select_all_documents_nodes() : void
		{
			const node0 : DOMNode = new DOMNode();
			const node1 : DOMNode = new DOMNode();
			
			const subnode0 : DOMNode = new DOMNode();
			const subnode1 : DOMNode = new DOMNode();
			
			const subsubnode0 : DOMNode = new DOMNode();
			const subsubnode1 : DOMNode = new DOMNode();
			const subsubnode2 : DOMNode = new DOMNode();
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
			
			subnode1.add(subsubnode1);
			subnode1.add(subsubnode2);
			
			const result : Vector.<IDOMNode> = document.select('//*');
			assertEquals('Result length should be 2', 2, result.length);
			assertEquals('Result item at 0 index should be same as initial node', node0, result[0]);
		}
	}
}
