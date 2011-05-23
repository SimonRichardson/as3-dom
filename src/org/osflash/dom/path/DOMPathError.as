package org.osflash.dom.path
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathError extends Error
	{
		
		public static const UNEXPECTED_CHAR : int = 0x01;

		public static const LEXER_EXHAUSTED : int = 0x02;

		public static const BUFFER_OVERFLOW : int = 0x03;
		
		public static const UNEXPECTED_TOKEN_TYPE : int = 0x04;
		
		public function DOMPathError(message : String)
		{
			super(message);
		}
		
		/**
		 * Get the type of error as a string representation using the type of error.
		 * 
		 * @param type of DOMPathError
		 * @return String representation of the error.
		 */
		public static function getType(type : int) : String
		{
			switch(type)
			{
				case UNEXPECTED_CHAR:
					return 'Unexpected char';
				case LEXER_EXHAUSTED:
					return 'Lexer exhausted';
				case BUFFER_OVERFLOW:
					return 'Buffer overflow';
				case UNEXPECTED_TOKEN_TYPE:
					return 'Unexpected token type';
				default:
					throw new ArgumentError('Given argument is Unknown');  
			}
		}
		
		/**
		 * Throws an DOMPathError for the corresponding type. This method does all the error 
		 * handling, including throwing.
		 * 
		 * @param type is Type of DOMPathError.
		 */
		public static function throwError(type : int) : void
		{
			switch(type)
			{
				case UNEXPECTED_CHAR:
					throw new DOMPathError('Unexpected character found');
				case LEXER_EXHAUSTED:
					throw new DOMPathError('Lexer has been exhausted');
				case BUFFER_OVERFLOW:
					throw new DOMPathError('Buffer overflow has occured');
				case UNEXPECTED_TOKEN_TYPE:
					throw new DOMPathError('Unexpected token type found');
				default:
					throw new ArgumentError('Given argument is Unknown');
			}
		}
	}
}
