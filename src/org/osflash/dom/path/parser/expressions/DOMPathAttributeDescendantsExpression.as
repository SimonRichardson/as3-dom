package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathAttributeDescendantsExpression extends DOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _name : IDOMPathExpression;
		
		/**
		 * @private
		 */
		private var _attributeName : IDOMPathExpression;
		
		public function DOMPathAttributeDescendantsExpression(	name : IDOMPathExpression,
																attributeName : IDOMPathExpression
																)
		{
			if(null == name) throw new ArgumentError('Given name can not be null');
			if(null == attributeName) throw new ArgumentError('Given attributeName can not be null');
			
			_name = name;
			_attributeName = attributeName;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			_name.describe(stream);
			
			stream.writeUTF('@');
			_attributeName.describe(stream);
		}

		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.ATTRIBUTE_DESCENDANTS;
		}
		
		public function get name() : IDOMPathExpression
		{
			return _name;
		}

		public function get attributeName() : IDOMPathExpression
		{
			return _attributeName;
		}
	}
}
