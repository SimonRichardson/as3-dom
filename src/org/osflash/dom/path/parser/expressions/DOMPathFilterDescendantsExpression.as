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
		
		/**
		 * @private
		 */
		private var _descendants : IDOMPathExpression;
		
		public function DOMPathFilterDescendantsExpression(	method : IDOMPathExpression,
															descendants : IDOMPathExpression
															)
		{
			_name = method;
			_descendants = descendants;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			_name.describe(stream);
			
			stream.writeUTF("(");
			_descendants.describe(stream);
			stream.writeUTF(")");
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

		public function get descendants() : IDOMPathExpression
		{
			return _descendants;
		}
	}
}