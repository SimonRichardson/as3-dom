package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathFilterDescendantsExpression extends DOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _name : IDOMPathExpression;
		
		public function DOMPathFilterDescendantsExpression(method : IDOMPathExpression)
		{
			_name = method;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			_name.describe(stream);
		}

		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.FILTER_DESCENDANTS;
		}
		
		public function get name() : IDOMPathExpression
		{
			return _name;
		}
	}
}
