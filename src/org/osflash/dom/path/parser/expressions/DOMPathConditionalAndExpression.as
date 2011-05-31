package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathConditionalAndExpression implements IDOMPathExpression
	{
		
		
		/**
		 * @private
		 */
		private var _left : IDOMPathExpression;
		
		/**
		 * @private
		 */		
		private var _right : IDOMPathExpression;
		
		public function DOMPathConditionalAndExpression(	left : IDOMPathExpression, 
															right : IDOMPathExpression
															)
		{
			if(null == left) throw new ArgumentError('Given left expression can not be null');
			if(null == right) throw new ArgumentError('Given right expression can not be null');
			
			_left = left;
			_right = right;
		}


		public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUTF('(');
			
			_left.describe(stream);
			
			stream.writeUTF('&&');
			
			_right.describe(stream);
			
			stream.writeUTF(')');
		}

		public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.CONDITIONAL_AND;
		}
	}
}
