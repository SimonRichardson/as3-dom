package org.osflash.dom.path
{
	import asunit.asserts.assertEquals;
	import asunit.asserts.assertEqualsArraysIgnoringOrder;

	import org.osflash.dom.element.DOMDocument;
	import org.osflash.dom.element.DOMNode;
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.IDOMNode;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathAttributeTest
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
		public function path_select_all_with_attribute_name() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			document.add(node0);
			document.add(node1);
									
			const result : Vector.<IDOMNode> = document.select('@name');
			assertEquals('Result length should be 2', 2, result.length);
			assertEqualsArraysIgnoringOrder('Result should contain node0 and node1',
														[node0, node1],
														[result[0], result[1]]
														);
		}
		
		[Test]
		public function path_select_all_with_invalide_attribute_name() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			document.add(node0);
			document.add(node1);
									
			const result : Vector.<IDOMNode> = document.select('@invalid');
			assertEquals('Result length should be 0', 0, result.length);
		}
	}
}
