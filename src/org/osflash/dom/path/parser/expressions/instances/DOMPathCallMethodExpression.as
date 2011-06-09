package org.osflash.dom.path.parser.expressions.instances
{
	import org.osflash.dom.path.parser.expressions.DOMPathExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.stream.IStreamOutput;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class DOMPathCallMethodExpression extends DOMPathExpression
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
			if(null == method) throw new ArgumentError('Given method can not be null');
			if(null == parameters) throw new ArgumentError('Given parameters can not be null');
			
			_method = method;
			_parameters = parameters;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IStreamOutput) : void
		{
			_method.describe(stream);
			
			stream.writeUTF("(");
			const total : int = _parameters.length;
			for (var i : int = 0; i < total; i++)
			{
				_parameters[i].describe(stream);
				if (i < total - 1) stream.writeUTF(", ");
			}
			stream.writeUTF(")");
		}

		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.CALL_METHOD;
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
