package org.osflash.dom.support
{
	import org.osflash.dom.element.DOMNode;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMConditionalNode extends DOMNode
	{

		private var _value : String;

		public function DOMConditionalNode(name : String, value : String)
		{
			super(name);

			_value = value;
		}

		public function get value() : String
		{
			return _value;
		}

		public function set value(name : String) : void
		{
			_value = name;
		}

		override public function toString() : String
		{
			return "[DOMConditionalNode (name='" + name + "', value='" + value + "']";
		}
	}
}
