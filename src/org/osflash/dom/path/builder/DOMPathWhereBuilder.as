package org.osflash.dom.path.builder
{
	import org.osflash.dom.path.parser.tokens.DOMPathTokenType;
	import org.osflash.stream.IStreamOutput;
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public final class DOMPathWhereBuilder implements IDOMPathWhereBuilder
	{
		
		/**
		 * @private
		 */
		private var _selector : IDOMPathSelectBuilder;
		
		/**
		 * @private
		 */
		private var _name : String;
		
		/**
		 * @private
		 */
		private var _stream : IStreamOutput;
		
		/**
		 * @private
		 */
		private var _streamPosition : int;
		
		public function DOMPathWhereBuilder(	stream : IStreamOutput,
												selector : IDOMPathSelectBuilder,
												name : String
												)
		{
			_selector = selector;
			
			_name = name;
			
			_stream = stream;
			_streamPosition = _stream.position;
			
			const seperator : String = DOMPathTokenType.getType(DOMPathTokenType.DOT.type);
			const opener : String = DOMPathTokenType.getType(DOMPathTokenType.LEFT_PAREN.type);
			const attribute : String = DOMPathTokenType.getType(DOMPathTokenType.ATTRIBUTE.type);
			
			_stream.writeUTF(seperator);
			_stream.writeUTF(opener);
			_stream.writeUTF(attribute);
			_stream.writeUTF(name);
		}
		
		/**
		 * @inheritDoc
		 */
		public function equals() : IDOMPathWhereOperatorBuilder
		{
			var operator : String = "";
			operator += DOMPathTokenType.getType(DOMPathTokenType.EQUALITY.type);
			operator += DOMPathTokenType.getType(DOMPathTokenType.EQUALITY.type);
			
			return new DOMPathWhereOperatorBuilder(_stream, this, operator);
		}
		
		/**
		 * @inheritDoc
		 */
		public function doesNotEqual() : IDOMPathWhereOperatorBuilder
		{
			var operator : String = "";
			operator += DOMPathTokenType.getType(DOMPathTokenType.BANG.type);
			operator += DOMPathTokenType.getType(DOMPathTokenType.EQUALITY.type);
			
			return new DOMPathWhereOperatorBuilder(_stream, this, operator);
		}
		
		/**
		 * @inheritDoc
		 */
		public function isLessThan() : IDOMPathWhereOperatorBuilder
		{
			var operator : String = "";
			operator += DOMPathTokenType.getType(DOMPathTokenType.BACK_ARROW.type);
			
			return new DOMPathWhereOperatorBuilder(_stream, this, operator);
		}
		
		/**
		 * @inheritDoc
		 */
		public function isLessThanOrEqualTo() : IDOMPathWhereOperatorBuilder
		{
			var operator : String = "";
			operator += DOMPathTokenType.getType(DOMPathTokenType.BACK_ARROW.type);
			operator += DOMPathTokenType.getType(DOMPathTokenType.EQUALITY.type);
			
			return new DOMPathWhereOperatorBuilder(_stream, this, operator);
		}
		
		/**
		 * @inheritDoc
		 */
		public function isGreaterThan() : IDOMPathWhereOperatorBuilder
		{
			var operator : String = "";
			operator += DOMPathTokenType.getType(DOMPathTokenType.FORWARD_ARROW.type);
			
			return new DOMPathWhereOperatorBuilder(_stream, this, operator);
		}
		
		/**
		 * @inheritDoc
		 */
		public function isGreaterThanOrEqualTo() : IDOMPathWhereOperatorBuilder
		{
			var operator : String = "";
			operator += DOMPathTokenType.getType(DOMPathTokenType.FORWARD_ARROW.type);
			operator += DOMPathTokenType.getType(DOMPathTokenType.EQUALITY.type);
			
			return new DOMPathWhereOperatorBuilder(_stream, this, operator);
		}
		
		/**
		 * @inheritDoc
		 */
		public function and(name : String) : IDOMPathWhereBuilder
		{
			var operator : String = "";
			operator += DOMPathTokenType.getType(DOMPathTokenType.AMPERSAND.type);
			operator += DOMPathTokenType.getType(DOMPathTokenType.AMPERSAND.type);
			
			const attribute : String = DOMPathTokenType.getType(DOMPathTokenType.ATTRIBUTE.type);
			
			_stream.writeUTF(operator);
			
			_stream.writeUTF(attribute);
			_stream.writeUTF(name);
			
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function or(name : String) : IDOMPathWhereBuilder
		{
			var operator : String = "";
			operator += DOMPathTokenType.getType(DOMPathTokenType.PIPE.type);
			operator += DOMPathTokenType.getType(DOMPathTokenType.PIPE.type);
			
			const attribute : String = DOMPathTokenType.getType(DOMPathTokenType.ATTRIBUTE.type);
			
			_stream.writeUTF(operator);
			
			_stream.writeUTF(attribute);
			_stream.writeUTF(name);
			
			return this;
		}
		
		/**
		 * @inheritDoc
		 */
		public function endWhere() : IDOMPathSelectBuilder
		{
			const closer : String = DOMPathTokenType.getType(DOMPathTokenType.RIGHT_PAREN.type);
			_stream.writeUTF(closer);
			
			return _selector;
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
