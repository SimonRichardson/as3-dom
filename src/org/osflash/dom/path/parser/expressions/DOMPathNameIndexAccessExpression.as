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
		private var _name : IDOMPathExpression;
		
		/**
		 * @private
		 */
		private var _parameter : IDOMPathExpression;

		public function DOMPathNameIndexAccessExpression(	name : IDOMPathExpression, 
															parameter : IDOMPathExpression
															)
		{
			if(null == name) throw new ArgumentError('Given name can not be null');
			if(null == parameter) throw new ArgumentError('Given parameter can not be null');
			
			_name = name;
			_parameter = parameter;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			_name.describe(stream);
			
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
		
		public function get name() : IDOMPathExpression
		{
			return _name;
		}

		public function get parameter() : IDOMPathExpression
		{
			return _parameter;
		}
	}
}
