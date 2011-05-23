package org.osflash.dom.element
{
	import org.osflash.dom.path.parser.DOMPathLexer;
	import org.osflash.dom.path.parser.IDOMPathLexer;
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
		public function select(path : String) : Vector.<IDOMNode>
		{
			if(null == path || path.length < 1) throw new ArgumentError('Given value can not be ' + 
																							'null');
			const lexer : IDOMPathLexer = new DOMPathLexer(path);
			return null;
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
