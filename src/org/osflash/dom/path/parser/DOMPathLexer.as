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
				var char : String = _source.charAt(_index++);
				var charCode : int = char.charCodeAt(0);
				
				// Try and grab the number or integer
				var buffer : String = '';
				if((charCode >= 48 && charCode <= 57) || (charCode >= 45 && charCode <= 46))
				{
					var nan : Boolean = false;
					var decimal : Boolean = false;
					var negative : Boolean = false; 
					if(charCode == 45)
					{
						buffer += '-';
						negative = true;
						
						if(hasNext)
						{
							// look forward to check we have a valid char
							char = _source.charAt(_index++);
							charCode = char.charCodeAt(0);
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
							// look forward to check we have a valid char
							char = _source.charAt(_index++);
							charCode = char.charCodeAt(0);
						}
						else DOMPathError.throwError(DOMPathError.LEXER_EXHAUSTED);
						
						// This isn't a decimal number!
						if(!(charCode >= 48 && charCode <= 57))
						{
							// Reset the index to the time before we try and get the number
							_index -= 2;
							char = _source.charAt(_index);
							charCode = char.charCodeAt(0);
							
							nan = true;
						}
					}
					else
					{
						buffer += char;
						
						if(hasNext)
						{
							char = _source.charAt(_index++);
							charCode = char.charCodeAt(0);
						}	
						else DOMPathError.throwError(DOMPathError.LEXER_EXHAUSTED);
					}
					
					// There are occasions when we're not a number (nan/NaN)
					if(!nan)
					{
						if(!(charCode == 46 || (charCode >= 48 && charCode <= 57)))
						{
							// rewind as it's only one char 
							_index--;
						}
						else
						{
							// append to the buffer
							buffer += char;
							
							while(	hasNext && 
									(charCode == 46 || 
									(charCode >= 48 && charCode <= 57))
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
								
								char = _source.charAt(_index++);
								charCode = char.charCodeAt(0);
								
								if(	!(charCode == 46 || 
									 (charCode >= 48 && charCode <= 57)))
								{
									// TODO: we should validate what this item it!
									// we've gone to far, roll back 1.
									_index--;
										
									break;
								}
								
								// append to the buffer
								buffer += char;
							}
						}
					
						if(decimal) 
							return new DOMPathToken(DOMPathTokenType.NUMBER, buffer);
						else if(negative) 
							return new DOMPathToken(DOMPathTokenType.INTEGER, buffer);
						else 
							return new DOMPathToken(DOMPathTokenType.UNSIGNED_INTEGER, buffer);
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
				else if((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122))
				{
					// we're a name here
					if(buffer != '') DOMPathError.throwError(DOMPathError.BUFFER_OVERFLOW);
					
					buffer += char;
					
					while(hasNext)
					{
						char = _source.charAt(_index++);
						charCode = char.charCodeAt(0);
						
						if(	!((charCode >= 48 && charCode <= 57) ||
							(charCode >= 65 && charCode <= 90) ||
							charCode == 95 || 
							(charCode >= 97 && charCode <= 122) 
							))
						{
							// we've gone to far, roll back 1.
							_index--;
							
							break;
						}
						
						buffer += char;
					}
					
					return new DOMPathToken(DOMPathTokenType.NAME, buffer);
				}
				else if(charCode == 34)
				{
					// we're a string here
					if(buffer != '') DOMPathError.throwError(DOMPathError.BUFFER_OVERFLOW);
					
					char = _source.charAt(_index++);
					charCode = char.charCodeAt(0);
					
					// grab upper and lower case letters
					while(hasNext && charCode != 34)
					{
						if(charCode == 92)
						{
							// trying to escape the string
							char = _source.charAt(_index++);
							charCode = char.charCodeAt(0);
							
							if(charCode == 34 || charCode == 92) buffer += char;
							else
							{
								buffer += String.fromCharCode(92);
								buffer += char;
							}
							
						}
						else buffer += char;
						
						char = _source.charAt(_index++);
						charCode = char.charCodeAt(0);
					}
					
					return new DOMPathToken(DOMPathTokenType.STRING, buffer);
				}
				else if(charCode == 32 || charCode == 9 || charCode == 10 || charCode == 13)
				{
					// This is effectively white space
					continue;
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
