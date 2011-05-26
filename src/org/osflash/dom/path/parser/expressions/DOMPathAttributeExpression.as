package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathAttributeExpression extends DOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _attribute : IDOMPathExpression;
		
		public function DOMPathAttributeExpression(attribute : IDOMPathExpression)
		{
			if(null == attribute) throw new ArgumentError('Given name can not be null');
			
			_attribute = attribute;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUTF('@');
			_attribute.describe(stream);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.ATTRIBUTE;
		}

		public function get attribute() : IDOMPathExpression
		{
			return _attribute;
		}
	}
}
