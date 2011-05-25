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
			if(null == condition) throw new ArgumentError('Given condition can not be null');
			if(null == thenArm) throw new ArgumentError('Given thenArm can not be null');
			if(null == elseArm) throw new ArgumentError('Given elseArm can not be null');
			
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
