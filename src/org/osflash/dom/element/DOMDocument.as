package org.osflash.dom.element
{
	import org.osflash.dom.path.DOMPath;
	import org.osflash.dom.path.IDOMPath;
	import org.osflash.dom.path.parser.DOMPathLexer;
	import org.osflash.dom.path.parser.DOMPathParser;
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.IDOMPathTokenIterator;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMDocument extends DOMNode implements IDOMDocument
	{
		
		/**
		 * 
		 */
		public function DOMDocument()
		{
			super();
		}

		/**
		 * @inheritDoc
		 */
		public function select(value : String) : Vector.<IDOMNode>
		{
			if(null == value || value.length < 1) throw new ArgumentError('Given value can not ' + 
																						'be null');
			const tokens : IDOMPathTokenIterator = new DOMPathLexer(value);
			const parser : IDOMPathParser = new DOMPathParser(tokens);
			const path : IDOMPath = new DOMPath(parser.parseExpression());
			return path.execute(this);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get document() : IDOMDocument { return this; }
		override public function set document(value : IDOMDocument) : void
		{
			DOMElementError.throwError(DOMElementError.DOCUMENT_IS_IMMUTABLE);
			
			value;
		}
	}
}
