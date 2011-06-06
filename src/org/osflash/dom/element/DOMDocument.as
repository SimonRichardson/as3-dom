package org.osflash.dom.element
{
	import org.osflash.dom.path.DOMPath;
	import org.osflash.dom.path.IDOMPath;
	import org.osflash.dom.path.builder.IDOMPathBuilder;
	import org.osflash.dom.path.parser.DOMPathLexer;
	import org.osflash.dom.path.parser.DOMPathParser;
	import org.osflash.dom.path.parser.IDOMPathParser;
	import org.osflash.dom.path.parser.IDOMPathTokenIterator;

	import flash.utils.Dictionary;

	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMDocument extends DOMNode implements IDOMDocument
	{

		private static const NAME : String = 'DOMDocument';
		
		/**
		 * @private
		 */
		private var _cache : Dictionary;
		
		/**
		 * @private
		 */
		private var _useCache : Boolean;
		
		/**
		 * @private
		 */
		private var _invalidated : Boolean;
		
		/**
		 * 
		 */
		public function DOMDocument(useCache : Boolean = false)
		{
			super(NAME);
			
			if(useCache)
			{
				_cache = new Dictionary();
				_invalidated = true;
			}
			else _invalidated = false;
			
			this.useCache = useCache;
		}

		/**
		 * @inheritDoc
		 */
		public function select(value : String) : Vector.<IDOMNode>
		{
			if (null == value || value.length < 1) throw new ArgumentError('Given value can not ' + 
																						'be null');
			if(useCache && !invalidated)
			{
				// TODO : possibly create a hash of the value to make it less heavy on the key side
				if(null != _cache[value])
				{
					// Return a clone of the cached results to prevent the removal of the vector.
					const cachedResults : Vector.<IDOMNode> = _cache[value];
					return cachedResults.concat();
				}
			}
																									
			const tokens : IDOMPathTokenIterator = new DOMPathLexer(value);
			const parser : IDOMPathParser = new DOMPathParser(tokens);
			const path : IDOMPath = new DOMPath(parser.parseExpression());
			const result : Vector.<IDOMNode> = path.execute(this);
			
			if(useCache)
			{
				_invalidated = false;
				_cache[value] = result;
			}
			
			return result;
		}
		
		/**
		 * @inheritDoc
		 */
		public function query(path : IDOMPathBuilder) : Vector.<IDOMNode>
		{
			if(null == path) throw new ArgumentError('Given value can not be null');
			return select(path.toQuery());
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
		
		/**
		 * @inheritDoc
		 */
		public function get useCache() : Boolean { return _useCache; }
		public function set useCache(value : Boolean) : void 
		{ 
			if(_useCache == value) return;
			
			_useCache = value;
			
			if(_useCache)
			{
				_cache = new Dictionary();
				_invalidated = true;
			}
			else
			{
				for(var lookup : String in _cache)
				{
					delete _cache[lookup];
				}
				_invalidated = false;
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function get invalidated() : Boolean { return _invalidated; }
		public function set invalidated(value : Boolean) : void { _invalidated = value; }
		
		/**
		 * @inheritDoc
		 */
		override public function toString() : String
		{
			return "[DOMDocument]";
		}
	}
}
