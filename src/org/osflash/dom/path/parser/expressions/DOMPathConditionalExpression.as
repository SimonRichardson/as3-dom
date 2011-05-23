package org.osflash.dom.path.parser.expressions
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class DOMPathConditionalExpression implements IDOMPathExpression
	{

		/**
		 * @private
		 */		
		private var _condition : IDOMPathExpression;

		/**
		 * @private
		 */
		private var _thenArm : IDOMPathExpression;

		/**
		 * @private
		 */
		private var _elseArm : IDOMPathExpression;

		public function DOMPathConditionalExpression(	condition : IDOMPathExpression, 
														thenArm : IDOMPathExpression, 
														elseArm : IDOMPathExpression
														)
		{
			_condition = condition;
			_thenArm = thenArm;
			_elseArm = elseArm;
		}

		
		/**
		 * @inheritDoc
		 */
		public function get type() : IDOMPathExpressionType
		{
			return null;
		}
	}
}
