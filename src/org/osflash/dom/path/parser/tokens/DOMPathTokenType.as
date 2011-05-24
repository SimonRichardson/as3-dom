package org.osflash.dom.path.parser.tokens
{
	import org.osflash.dom.path.DOMPathError;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathTokenType
	{
		
		public static const EOF : DOMPathTokenType = new DOMPathTokenType(0x01);

		public static const NUMBER : DOMPathTokenType = new DOMPathTokenType(0x02);

		public static const INTEGER : DOMPathTokenType = new DOMPathTokenType(0x03);

		public static const STRING : DOMPathTokenType = new DOMPathTokenType(0x04);
		
		public static const LEFT_PAREN : DOMPathTokenType = new DOMPathTokenType(0x05);

		public static const RIGHT_PAREN : DOMPathTokenType = new DOMPathTokenType(0x06);

		public static const COMMA : DOMPathTokenType = new DOMPathTokenType(0x07);

		public static const EQUALITY : DOMPathTokenType = new DOMPathTokenType(0x08);

		public static const PLUS : DOMPathTokenType = new DOMPathTokenType(0x09);

		public static const MINUS : DOMPathTokenType = new DOMPathTokenType(0x10);

		public static const ASTERISK : DOMPathTokenType = new DOMPathTokenType(0x11);

		public static const SLASH : DOMPathTokenType = new DOMPathTokenType(0x12);

		public static const CARET : DOMPathTokenType = new DOMPathTokenType(0x13);

		public static const TILDE : DOMPathTokenType = new DOMPathTokenType(0x14);

		public static const BANG : DOMPathTokenType = new DOMPathTokenType(0x15);

		public static const QUESTION : DOMPathTokenType = new DOMPathTokenType(0x16);

		public static const COLON : DOMPathTokenType = new DOMPathTokenType(0x17);

		public static const LEFT_SQUARE : DOMPathTokenType = new DOMPathTokenType(0x18);
		
		public static const RIGHT_SQUARE : DOMPathTokenType = new DOMPathTokenType(0x19);
		
		public static const ATTRIBUTE : DOMPathTokenType = new DOMPathTokenType(0x20);
		
		/**
		 * @private
		 */
		private var _type : int;
		
		/**
		 * @private
		 */
		private var _value : String;
		
		/**
		 * Constructor for the DOMPathTokenType, which is used as an Enum for DOMPathTokens.
		 */
		public function DOMPathTokenType(type : int)
		{
			_type = type;
		}
		
		/**
		 * Get the types to filter on for the lexer.
		 * 
		 * @return Vector.<DOMPathTokenType> of items to be identified for the lexer.
		 */
		public static function getTypes() : Vector.<DOMPathTokenType>
		{
			return Vector.<DOMPathTokenType>([	LEFT_PAREN,
												RIGHT_PAREN,
												COMMA,
												EQUALITY,
												PLUS,
												MINUS,
												ASTERISK,
												SLASH,
												CARET,
												TILDE,
												BANG,
												QUESTION,
												COLON,
												LEFT_SQUARE,
												RIGHT_SQUARE,
												ATTRIBUTE
											 ]);
		}
		
		/**
		 * Get the type as string
		 */
		public static function getType(type : int) : String
		{
			switch(type)
			{
				case EOF.type: return 'EoF';
				case NUMBER.type: return 'Number';
				case INTEGER.type: return 'int';
				case STRING.type: return 'String';
				case LEFT_PAREN.type: return '(';
				case RIGHT_PAREN.type: return ')';
				case COMMA.type: return ',';
				case EQUALITY.type: return '=';
				case PLUS.type: return '+';
				case MINUS.type: return '-';
				case ASTERISK.type: return '*';
				case SLASH.type: return '/';
				case CARET.type: return '^';
				case TILDE.type: return '~';
				case BANG.type: return '!';
				case QUESTION.type: return '?';
				case COLON.type: return ':';
				case LEFT_SQUARE.type: return '[';
				case RIGHT_SQUARE.type: return ']';
				case ATTRIBUTE.type: return '@';
				default:
					DOMPathError.throwError(DOMPathError.UNEXPECTED_TOKEN_TYPE);
					break;
			}
			
			return null;
		}
		
		/**
		 * Get the type of token. This is a unique identifier and is only used for quick analysis.
		 * 
		 * @return int
		 */
		public function get type() : int
		{
			return _type;
		}

		/**
		 * Get the value of the token.
		 * 
		 * @return String
		 */
		public function get value() : String
		{
			// Create a lazy initialiser because not all types are know at constructor time.
			if(null != _value) return _value;
			return (_value = getType(type));
		}
	}
}
