package org.osflash.dom.element
{
	import asunit.asserts.assertTrue;
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
		public function test_numChildren_is_zero() : void
		{
			assertTrue('DOMDocument numChildren should be zero', document.numChildren == 0);
		}
	}
}
