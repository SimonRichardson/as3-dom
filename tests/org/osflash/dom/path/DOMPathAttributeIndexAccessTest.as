package org.osflash.dom.path
{
	import asunit.asserts.assertEquals;

	import org.osflash.dom.element.DOMDocument;
	import org.osflash.dom.element.DOMNode;
	import org.osflash.dom.element.IDOMDocument;
	import org.osflash.dom.element.IDOMNode;
	import org.osflash.dom.support.DOMSpecialAttributeNode;
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
		
		[Test]
		public function path_select_invalid_index_with_attribute_name() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			document.add(node0);
			document.add(node1);
									
			const result : Vector.<IDOMNode> = document.select('@name[2]');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_invalid_index_with_attribute_name_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			document.add(node0);
			document.add(node1);
									
			const result : Vector.<IDOMNode> = document.select('/@name[2]');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_invalid_index_with_attribute_name_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node0');
			const node1 : DOMNode = new DOMNode('node1');
			
			document.add(node0);
			document.add(node1);
									
			const result : Vector.<IDOMNode> = document.select('//@name[2]');
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
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
		
		[Test]
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
		
		[Test]
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
		
		[Test]
		public function path_select_invalid_index_for_subnode1_with_attribute_name() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('node1@name[3]/subnode1');
			
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_invalid_index_for_subnode1_with_attribute_name_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('/node1@name[3]/subnode1');
			
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_invalid_index_for_subnode1_with_attribute_name_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node1@name[3]/subnode1');
			
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_subnode1_with_attribute_name() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('node1@name[1]/subnode1');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subnode1', subnode1, result[0]);
		}
		
		[Test]
		public function path_select_subnode1_with_attribute_name_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('/node1@name[1]/subnode1');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subnode1', subnode1, result[0]);
		}
		
		[Test]
		public function path_select_subnode1_with_attribute_name_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node1@name[1]/subnode1');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subnode1', subnode1, result[0]);
		}
		
		[Test]
		public function path_select_subnode1_with_attribute_name_at_index5() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('node1@name[1]/subnode1@name[5]');
			
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_subnode1_with_attribute_name_at_index5_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('/node1@name[1]/subnode1@name[5]');
			
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_subnode1_with_attribute_name_at_index5_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node1@name[1]/subnode1@name[5]');
			
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_subnode1_with_attribute_name_at_index0() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('node1@name[1]/subnode1@name[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subnode1', subnode1, result[0]);
		}
		
		[Test]
		public function path_select_subnode1_with_attribute_name_at_index0_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('/node1@name[1]/subnode1@name[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subnode1', subnode1, result[0]);
		}
		
		[Test]
		public function path_select_subnode1_with_attribute_name_at_index0_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node1@name[1]/subnode1@name[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subnode1', subnode1, result[0]);
		}
		
		[Test]
		public function path_select_subsubnode0_with_attribute_name_at_index5() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode1.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('node1@name[1]/subnode1@name[5]/subsubnode0');
			
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_subsubnode0_with_attribute_name_at_index5_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode1.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('/node1@name[1]/subnode1@name[5]/subsubnode0');
			
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		
		[Test]
		public function path_select_subsubnode0_with_attribute_name_at_index5_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode1.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node1@name[1]/subnode1@name[5]/subsubnode0');
			
			assertEquals('Result length should be 0', 0, result.length);
		}
		
		[Test]
		public function path_select_subsubnode0_with_attribute_name_at_index0() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode1.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('node1@name[1]/subnode1@name[0]/subsubnode0');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subsubnode0', subsubnode0, result[0]);
		}
		
		[Test]
		public function path_select_subsubnode0_with_attribute_name_at_index0_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode1.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('/node1@name[1]/subnode1@name[0]/subsubnode0');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subsubnode0', subsubnode0, result[0]);
		}
		
		[Test]
		public function path_select_subsubnode0_with_attribute_name_at_index0_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode1.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node1@name[1]/subnode1@name[0]/subsubnode0');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subsubnode0', subsubnode0, result[0]);
		}
		
		[Test]
		public function path_select_node1_with_attribute_name() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('node1@name[1]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain node1', node1, result[0]);
		}
		
		[Test]
		public function path_select_node1_with_attribute_name_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('/node1@name[1]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain node1', node1, result[0]);
		}
		
		[Test]
		public function path_select_node1_with_attribute_name_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node1@name[1]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain node1', node1, result[0]);
		}
		
		[Test]
		public function path_select_node1_with_attribute_special() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('node1@special[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain node1', node1, result[0]);
		}
		
		[Test]
		public function path_select_node1_with_attribute_special_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('/node1@special[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain node1', node1, result[0]);
		}
		
		[Test]
		public function path_select_node1_with_attribute_special_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node1@special[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain node1', node1, result[0]);
		}
		
		[Test]
		public function path_select_node2_with_attribute_special() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			const node2 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node2');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('node2@special[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain node2', node2, result[0]);
		}
		
		[Test]
		public function path_select_node2_with_attribute_special_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			const node2 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node2');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('/node2@special[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain node2', node2, result[0]);
		}
		
		[Test]
		public function path_select_nodes_with_attribute_special_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			const node2 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node2');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMNode = new DOMNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node2@special[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain node2', node2, result[0]);
		}
		
		[Test]
		public function path_select_subnode1_with_attribute_special() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			const node2 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node2');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('node1/subnode1@special[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subnode1', subnode1, result[0]);
		}
		
		[Test]
		public function path_select_subnode1_with_attribute_special_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			const node2 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node2');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('/node1/subnode1@special[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subnode1', subnode1, result[0]);
		}
		
		[Test]
		public function path_select_subnode1_with_attribute_special_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			const node2 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node2');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
						
			const result : Vector.<IDOMNode> = document.select('//node1/subnode1@special[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subnode1', subnode1, result[0]);
		}
		
		[Test]
		public function path_select_subsubnode1_with_attribute_special() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			const node2 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node2');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			const subsubnode1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('subsubnode1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
			subnode0.add(subsubnode1);
						
			const result : Vector.<IDOMNode> = document.select('node1/subnode0/subsubnode1@special[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subsubnode1', subsubnode1, result[0]);
		}
		
		[Test]
		public function path_select_subsubnode1_with_attribute_special_in_context() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			const node2 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node2');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			const subsubnode1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('subsubnode1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
			subnode0.add(subsubnode1);
						
			const result : Vector.<IDOMNode> = document.select('/node1/subnode0/subsubnode1@special[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subsubnode1', subsubnode1, result[0]);
		}
		
		[Test]
		public function path_select_subsubnode1_with_attribute_special_in_document() : void
		{
			const node0 : DOMNode = new DOMNode('node1');
			const node1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node1');
			const node2 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('node2');
			
			const subnode0 : DOMNode = new DOMNode('subnode0');
			const subnode1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('subnode1');
			
			const subsubnode0 : DOMNode = new DOMNode('subsubnode0');
			const subsubnode1 : DOMSpecialAttributeNode = new DOMSpecialAttributeNode('subsubnode1');
			
			document.add(node0);
			document.add(node1);
			document.add(node2);
			
			node1.add(subnode0);
			node1.add(subnode1);
			
			subnode0.add(subsubnode0);
			subnode0.add(subsubnode1);
						
			const result : Vector.<IDOMNode> = document.select('//node1/subnode0/subsubnode1@special[0]');
			
			assertEquals('Result length should be 1', 1, result.length);
			assertEquals('Result should contain subsubnode1', subsubnode1, result[0]);
		}
	}
}
