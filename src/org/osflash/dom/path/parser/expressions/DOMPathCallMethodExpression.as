package org.osflash.dom.path.parser.expressions
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class DOMPathCallMethodExpression implements IDOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _method : IDOMPathExpression;
		
		/**
		 * @private
		 */
		private var _parameters : Vector.<IDOMPathExpression>;

		public function DOMPathCallMethodExpression(	method : IDOMPathExpression, 
														parameters : Vector.<IDOMPathExpression>
														)
		{
			_method = method;
			_parameters = parameters;
		}

		/**
		 * @inheritDoc
		 */
		public function get type() : DOMPathExpressionType
		{
			return null;
		}

		public function get method() : IDOMPathExpression
		{
			return _method;
		}

		public function get parameters() : Vector.<IDOMPathExpression>
		{
			return _parameters;
		}
	}
}
