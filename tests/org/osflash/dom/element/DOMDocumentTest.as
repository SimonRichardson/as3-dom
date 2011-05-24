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
		public function add_elements_and_path_select_all() : void
		{
			const node : DOMNode = new DOMNode();
			
			document.add(node);
			
			const result : Vector.<IDOMNode> = document.select('*');
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result item at 0 index should be same as initial node', node, result[0]);
		}
	}
}
