package org.osflash.dom.path.parser.tokens
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathToken
	{
		
		/**
		 * @private
		 */
		private var _type : DOMPathTokenType;		
		
		/**
		 * @private
		 */		
		private var _buffer : String;
		
		/**
		 * Create a new DOMPathToken
		 */
		public function DOMPathToken(type : DOMPathTokenType, buffer : String)
		{
			_type = type;
			_buffer = buffer;
		}
		
		/**
		 * Get the current type of the DOMPathToken.
		 * 
		 * @return DOMPathTokenType
		 */
		public function get type() : DOMPathTokenType
		{
			return _type;
		}
		
		/**
		 * Get the current buffer of the DOMPathToken
		 * 
		 * @return String
		 */
		public function get buffer() : String
		{
			return _buffer;
		}
	}
}
