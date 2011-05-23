package org.osflash.dom.path.parser.tokens
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathTokenType
	{
		
		public static const EOF : DOMPathTokenType = new DOMPathTokenType(0x01);

		public static const NUMBER : DOMPathTokenType = new DOMPathTokenType(0x02);

		public static const INTEGER : DOMPathTokenType = new DOMPathTokenType(0x03);

		public static const STRING : DOMPathTokenType = new DOMPathTokenType(0x04);

		private var _type : int;

		public function DOMPathTokenType(type : int)
		{
			_type = type;
		}
		
		public function get type() : int
		{
			return _type;
		}

	}
}
