package org.osflash.dom.path.builder
{
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	import org.osflash.stream.IStreamOutput;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMPathAttributeBuilder implements IDOMPathAttributeBuilder
	{

		/**
		 * @inheritDoc
		 */
		private var _attributeName : String;
		
		/**
		 * @inheritDoc
		 */
		private var _stream : IStreamOutput;
		
		/**
		 * @inheritDoc
		 */
		private var _streamPosition : uint;

		public function DOMPathAttributeBuilder(	stream : IStreamOutput, 
													attributeName : String
													)
		{
			_attributeName = attributeName;

			_stream = stream;
			_streamPosition = _stream.position;
			
			const attribute : String = DOMPathTokenType.getType(DOMPathTokenType.ATTRIBUTE.type);
			
			_stream.writeUTF(attribute);
			_stream.writeUTF(_attributeName);
		}
		
		/**
		 * @inheritDoc
		 */
		public function atIndex(index : uint) : IDOMPathIndexBuilder
		{
			return new DOMPathIndexBuilder(_stream, index);
		}
				
		/**
		 * @inheritDoc
		 */
		public function toQuery() : String
		{
			_stream.position = 0;
			return _stream.toString();
		}
		
		/**
		 * @inheritDoc
		 */
		public function toString() : String
		{
			_stream.position = _streamPosition;
			return _stream.toString();
		}
	}
}
