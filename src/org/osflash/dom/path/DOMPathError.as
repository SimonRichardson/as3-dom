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

		public static const INVALID_EQUALITY : int = 0x11;
		
		public static const INVALID_EXPRESSION : int = 0x12;

		public static const ABSTRACT_METHOD : int = 0x13;

		public static const SYNTAX_ERROR : int = 0x14;
		
		public static const BUFFER_UNDERFLOW : int = 0x15;
		
		public static const INVALID_ELEMENT : int = 0x16;

		public static const DOMDOCUMENT_NOT_AVAILABLE : int = 0x17;
		
		public static const UNEXPECTED_EOF_TOKEN : int = 0x18;
		
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
					return 'unexpectedChar';
				case LEXER_EXHAUSTED:
					return 'lexerExhausted';
				case BUFFER_OVERFLOW:
					return 'bufferOverflow';
				case UNEXPECTED_TOKEN_TYPE:
					return 'unexpectedTokenType';
				case TOKEN_ASSIGNED_ALREADY:
					return 'tokenAssignedAlready';
				case PARSER_EXHAUSTED:
					return 'parserExhausted';
				case PARSER_EXHAUSTED_LEXER:
					return 'parserExhaustedLexer';
				case TOKEN_IS_NULL:
					return 'tokenIsNull';
				case UNEXPECTED_TOKEN:
					return 'unexpectedToken';
				case PARSER_ERROR:
					return 'parserError';
				case INVALID_EQUALITY:
					return 'invalidEquality';
				case INVALID_EXPRESSION:
					return 'invalidExpression';
				case ABSTRACT_METHOD:
					return 'abstractMethod';
				case SYNTAX_ERROR:
					return 'syntaxError';
				case BUFFER_UNDERFLOW:
					return 'bufferUnderflow';
				case INVALID_ELEMENT:
					return 'invalidElement';
				case DOMDOCUMENT_NOT_AVAILABLE:
					return 'domdocumentNotAvailable';
				case UNEXPECTED_EOF_TOKEN:
					return 'unexpectedEofToken';
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
				case INVALID_EQUALITY:
					throw new DOMPathError('The left-hand side of an assignment must be a string');
				case INVALID_EXPRESSION:
					throw new DOMPathError('Unknown expression');
				case ABSTRACT_METHOD:
					throw new DOMPathError('Abstract method');
				case SYNTAX_ERROR:
					throw new DOMPathError('Syntax error');
				case BUFFER_UNDERFLOW:
					throw new DOMPathError('Buffer underflow has occured');
				case INVALID_ELEMENT:
					throw new DOMPathError('Invalid DOMElement found');
				case DOMDOCUMENT_NOT_AVAILABLE:
					throw new DOMPathError('Unable to locate the DOMDocument');
				case UNEXPECTED_EOF_TOKEN:
					throw new DOMPathError('Unexpected EoF token type found');
				default:
					throw new ArgumentError('Given argument is Unknown');
			}
		}
	}
}
