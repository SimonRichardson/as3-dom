package org.osflash.dom.path.parser.parselets.types
{
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.expressions.IDOMPathExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathBooleanExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathNameExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathNullExpression;
	import org.osflash.dom.path.parser.expressions.types.DOMPathUndefinedExpression;
	import org.osflash.dom.path.parser.parselets.IDOMPathPrefixParselet;
	import org.osflash.dom.path.parser.tokens.DOMPathToken;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public final class DOMPathNameParselet implements IDOMPathPrefixParselet
	{

		/**
		 * @inheritDoc
		 */
		public function parse(parser : IDOMPathParser, token : DOMPathToken) : IDOMPathExpression
		{
			// This is where we extract the name, we should add a hook here to add your own
			// expressions for easier integration
			const buffer : String = token.buffer;
			if(buffer == "true" || buffer == "false")
			{
				const boolean : Boolean = buffer ? true : false;
				return new DOMPathBooleanExpression(boolean);
			}
			else if(buffer == "null")
				return new DOMPathNullExpression();
			else if(buffer == "undefined")
				return new DOMPathUndefinedExpression();
			else
				return new DOMPathNameExpression(buffer);
		}
	}
}
