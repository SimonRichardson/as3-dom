package org.osflash.dom.path
{
	import asunit.asserts.assertEquals;

	import org.osflash.dom.path.builder.DOMPathBuilder;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathBuilderTest
	{
		
		[Tester]
		public function test_select_syntax() : void
		{
			const query : String = new DOMPathBuilder()
												.selectWithString('node1')
												.toQuery();
			
			assertEquals('Query should equal', '/node1', query);	
		}
		
		[Tester]
		public function test_select_with_index_syntax() : void
		{
			const query : String = new DOMPathBuilder()
												.selectWithString('node1')
												.atIndex(0)
												.toQuery();
			
			assertEquals('Query should equal', '/node1[0]', query);	
		}
		
		[Test]
		public function test_select_with_method_call_syntax() : void
		{
			const query : String = new DOMPathBuilder()
												.selectWithString('node1')
												.andCallingMethod('name')
												.toQuery();
			
			assertEquals('Query should equal', '/node1.name()', query);	
		}
		
		[Test]
		public function test_select_with_method_call_syntax_with_args() : void
		{
			const query : String = new DOMPathBuilder()
												.selectWithString('node1')
												.andCallingMethod('name')
												.startArguments()
													.addInt(1)
													.addInt(2)
													.addString('hello')
												.endArguments()
												.toQuery();
			
			assertEquals('Query should equal', '/node1.name(1,2,"hello")', query);	
		}
	}
}
