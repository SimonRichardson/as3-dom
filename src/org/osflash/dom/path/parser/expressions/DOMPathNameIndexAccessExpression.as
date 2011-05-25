package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathNameIndexAccessExpression extends DOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _method : IDOMPathExpression;
		
		/**
		 * @private
		 */
		private var _parameter : IDOMPathExpression;

		public function DOMPathNameIndexAccessExpression(	method : IDOMPathExpression, 
															parameter : IDOMPathExpression
															)
		{
			_method = method;
			_parameter = parameter;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			_method.describe(stream);
			
			stream.writeUTF("[");
			_parameter.describe(stream);
			stream.writeUTF("]");
		}

		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.NAME_INDEX_ACCESS;
		}
		
		public function get method() : IDOMPathExpression
		{
			return _method;
		}

		public function get parameter() : IDOMPathExpression
		{
			return _parameter;
		}
	}
}
