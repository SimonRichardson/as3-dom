package org.osflash.dom.path
{
	import asunit.asserts.assertEquals;

	import org.osflash.dom.element.DOMDocument;
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.support.DOMCallMethodNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
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
			const node0 : DOMCallMethodNode = new DOMCallMethodNode('node0');
			const node1 : DOMCallMethodNode = new DOMCallMethodNode('node1');
			const node2 : DOMCallMethodNode = new DOMCallMethodNode('node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
									
			const result : Vector.<IDOMNode> = document.select('node1@methodNoArg()');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		[Test]
		public function path_select_node1_call_method_with_string_arg() : void
		{
			const node0 : DOMCallMethodNode = new DOMCallMethodNode('node0');
			const node1 : DOMCallMethodNode = new DOMCallMethodNode('node1');
			const node2 : DOMCallMethodNode = new DOMCallMethodNode('node1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
									
			const result : Vector.<IDOMNode> = document.select('node1@methodWithStringArg("hello")');
			assertEquals('Result length should be 2', 2, result.length);
		}
		
		
	}
}
