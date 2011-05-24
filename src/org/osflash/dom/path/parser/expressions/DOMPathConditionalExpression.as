package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class DOMPathConditionalExpression extends DOMPathExpression
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
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUTF("(");
			
			_condition.describe(stream);
			stream.writeUTF(" ? ");
			_thenArm.describe(stream);
			stream.writeUTF(" : ");
			_elseArm.describe(stream);
			
			stream.writeUTF(")");
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return null;
		}
	}
}
