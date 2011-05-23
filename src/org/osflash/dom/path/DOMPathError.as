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

		public static const TOKEN_ASSIGNED_ALREADY : int = 0x05;
		
		public static const PARSER_EXHAUSTED : int = 0x06;
		
		public static const PARSER_EXHAUSTED_LEXER : int = 0x07;

		public static const TOKEN_IS_NULL : int = 0x08;

		public static const UNEXPECTED_TOKEN : int = 0x09;

		public static const PARSER_ERROR : int = 0x10;
		
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
				case TOKEN_ASSIGNED_ALREADY:
					return 'Token assigned already';
				case PARSER_EXHAUSTED:
					return 'Parser exhausted';
				case PARSER_EXHAUSTED_LEXER:
					return 'Parser exhausted lexer';
				case TOKEN_IS_NULL:
					return 'Token is null';
				case UNEXPECTED_TOKEN:
					return 'Unexpected token';
				case PARSER_ERROR:
					return 'Parser error';
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
				case TOKEN_ASSIGNED_ALREADY:
					throw new DOMPathError('Token has already been assigned and can not be ' + 
																				'assigned again');
				case PARSER_EXHAUSTED:
					throw new DOMPathError('Parser has been exhausted');
				case PARSER_EXHAUSTED_LEXER:
					throw new DOMPathError('Parser has exhausted the lexer');
				case TOKEN_IS_NULL:
					throw new DOMPathError('Token is null');
				case UNEXPECTED_TOKEN:
					throw new DOMPathError('Unexpected token');
				case PARSER_ERROR:
					throw new DOMPathError('Parser error');
				default:
					throw new ArgumentError('Given argument is Unknown');
			}
		}
	}
}
