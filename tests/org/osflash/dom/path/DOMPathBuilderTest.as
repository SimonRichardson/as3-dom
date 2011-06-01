package org.osflash.dom.path
{
	import asunit.asserts.assertEquals;

	import org.osflash.dom.path.builder.DOMPathBuilder;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathBuilderTest
	{
		
		[Test]
		public function test_select_syntax() : void
		{
			const query : String = new DOMPathBuilder()
												.select('node1')
												.toQuery();
			
			assertEquals('Query should equal', '/node1', query);	
		}
		
		[Test]
		public function test_select_with_index_syntax() : void
		{
			const query : String = new DOMPathBuilder()
												.select('node1')
												.withIndex(0)
												.toQuery();
			
			assertEquals('Query should equal', '/node1[0]', query);	
		}
		
		[Test]
		public function test_select_with_method_call_syntax() : void
		{
			const query : String = new DOMPathBuilder()
												.select('node1')
												.callingMethod('name', 1, 2, "hello")
												.toQuery();
			
			assertEquals('Query should equal', '/node1.name(1,2,"hello")', query);	
		}
	}
}
