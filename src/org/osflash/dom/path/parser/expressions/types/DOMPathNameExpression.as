package org.osflash.dom.path.parser.expressions.types
{
	import org.osflash.dom.path.parser.expressions.DOMPathExpression;
	import org.osflash.dom.path.parser.expressions.DOMPathExpressionType;
	import org.osflash.dom.path.parser.stream.IDOMPathOutputStream;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathNameExpression extends DOMPathExpression
	{
		
		/**
		 * @private
		 */
		private var _name : String;
		
		public function DOMPathNameExpression(name : String)
		{
			if(null == name) throw new ArgumentError('Given name can not be null');
			
			_name = name;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function describe(stream : IDOMPathOutputStream) : void
		{
			stream.writeUTF(_name);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get type() : DOMPathExpressionType
		{
			return DOMPathExpressionType.NAME;
		}

		public function get name() : String
		{
			return _name;
		}
		
		public function toString() : String 
		{
			return "[DOMPathNameExpression (name='" + name + "')]";
		}
	}
}
