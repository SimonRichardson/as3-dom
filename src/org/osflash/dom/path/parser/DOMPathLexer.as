package org.osflash.dom.path.parser
{
	import org.osflash.dom.path.DOMPathError;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;

	import flash.utils.Dictionary;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathLexer implements IDOMPathTokenIterator
	{
		
		/**
		 * @private
		 */
		private var _index : int;
		
		/**
		 * @private
		 */
		private var _source : String;
		
		/**
		 * @private
		 */
		private var _types : Dictionary;
		
		/**
		 * Constructor for creating a DOMPathLexer which will be used to analyse the source of a
		 * string and create tokens from the resulting code.
		 * 
		 * @param source String containing a valid syntax to be analysed.
		 */
		public function DOMPathLexer(source : String)
		{
			if(null == source || source.length < 1) throw new ArgumentError('Given value can not ' + 
																						'be null');
			_index = 0;
			_source = source;
			
			_types = new Dictionary();
			
			// Fill the items to test
			const types : Vector.<DOMPathTokenType> = DOMPathTokenType.getTypes();
			const total : int = types.length;
			for(var i : int = 0; i<total; i++)
			{
				 const type : DOMPathTokenType = types[i];
				 const value : String = type.value;
				 if(null == value) DOMPathError.throwError(DOMPathError.UNEXPECTED_TOKEN_TYPE);
				 _types[value] = type;
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function get hasNext() : Boolean
		{
			return _index < _source.length;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get next() : DOMPathToken
		{
			while(hasNext)
			{	
				var char : String = _source.charAt(_index);
				var charCode : int = char.charCodeAt(0);
				
				_index++;
				
				// Try and grab the number or integer
				var buffer : String = '';
				if((charCode >= 48 && charCode <= 57) || charCode == 45 || charCode == 46)
				{
					var decimal : Boolean = false;
					if(charCode == 45)
					{
						buffer += '-';
						
						if(hasNext)
						{
							char = _source.charAt(_index);
							charCode = char.charCodeAt(0);
							
							_index++;
						}
						else DOMPathError.throwError(DOMPathError.LEXER_EXHAUSTED);
						
						if(charCode != 46 && !(charCode >= 48 && charCode <= 57))
							DOMPathError.throwError(DOMPathError.UNEXPECTED_CHAR);
					}
					else if(charCode == 46)
					{
						buffer += '.';
						decimal = true;
						
						if(hasNext)
						{
							char = _source.charAt(_index);
							charCode = char.charCodeAt(0);
							
							_index++;
						}
						else DOMPathError.throwError(DOMPathError.LEXER_EXHAUSTED);
						
						if(!(charCode >= 48 && charCode <= 57))
							DOMPathError.throwError(DOMPathError.UNEXPECTED_CHAR);
					}
					
					while(	hasNext && 
							charCode == 46 || 
							(charCode >= 48 && charCode <= 57)
							)
					{
						// Find out if we've got a decimal or not
						if(charCode == 46)
						{
							if(!decimal) decimal = true;
							else 
							{
								// We've found another decimal...
								DOMPathError.throwError(DOMPathError.UNEXPECTED_CHAR);
							}
						}
						
						char = _source.charAt(_index);
						charCode = char.charCodeAt(0);
						
						_index++;
						
						// append to the buffer
						buffer += char;
					}
					
					if(decimal) return new DOMPathToken(DOMPathTokenType.NUMBER, buffer);
					else return new DOMPathToken(DOMPathTokenType.INTEGER, buffer);
				}
				
				// Work through index access
				if(charCode == 91)
				{
					if(buffer != '') DOMPathError.throwError(DOMPathError.BUFFER_OVERFLOW);
					
					char = _source.charAt(_index);
					charCode = char.charCodeAt(0);
						
					_index++;
					
					while(hasNext && (charCode >= 48 && charCode <= 57))
					{
						buffer += char;
						
						char = _source.charAt(_index);
						charCode = char.charCodeAt(0);
						
						_index++;
						
						if(charCode == 93) 
							return new DOMPathToken(DOMPathTokenType.INDEX_ACCESS, buffer);
						else if(!(charCode >= 48 && charCode <= 57))
						{
							// We've found something...
							DOMPathError.throwError(DOMPathError.UNEXPECTED_CHAR);
						}
					}
				}
				
				// Work through the types
				const type : DOMPathTokenType = _types[char];
				if(null != type)
				{
					// Use a pratt lexer here
					// @see
					// http://journal.stuffwithstuff.com/2011/03/19/pratt-parsers-expression-parsing-made-easy/
					return new DOMPathToken(type, char);
				}
				else if(charCode == 34)
				{
					// we're a string here
					if(buffer != '') DOMPathError.throwError(DOMPathError.BUFFER_OVERFLOW);
					
					char = _source.charAt(_index);
					charCode = char.charCodeAt(0);
					
					_index++;
					
					// grab upper and lower case letters
					while(hasNext && charCode != 34)
					{
						if(charCode == 92)
						{
							// trying to escape the string
							char = _source.charAt(_index);
							charCode = char.charCodeAt(0);
						
							_index++;
							
							if(charCode == 34 || charCode == 92) buffer += char;
							else
							{
								buffer += String.fromCharCode(92);
								buffer += char;
							}
							
						}
						else buffer += char;
						
						char = _source.charAt(_index);
						charCode = char.charCodeAt(0);
						
						_index++;
					}
					
					return new DOMPathToken(DOMPathTokenType.STRING, buffer);
				}
				else
				{
					DOMPathError.throwError(DOMPathError.UNEXPECTED_CHAR);
				}
			}
			
			return new DOMPathToken(DOMPathTokenType.EOF, "");
		}

	}
}
