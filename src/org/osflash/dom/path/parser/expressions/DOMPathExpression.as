package org.osflash.dom.path.parser.expressions
{
	import org.osflash.dom.path.DOMPathError;
	import org.osflash.dom.path.stream.IDOMPathOutputStream;

	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public class DOMPathExpression implements IDOMPathExpression
	{

		public function DOMPathExpression()
		{
		}

		/**
		 * @inheritDoc
		 */
		public function describe(stream : IDOMPathOutputStream) : void
		{
			DOMPathError.throwError(DOMPathError.ABSTRACT_METHOD);
		}

		/**
		 * @inheritDoc
		 */
		public function get type() : DOMPathExpressionType
		{
			DOMPathError.throwError(DOMPathError.ABSTRACT_METHOD);

			return null;
		}
	}
}
