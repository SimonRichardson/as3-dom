package org.osflash.dom.element
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMError extends Error
	{
		
		public static const REMOVE_NODE_MISMATCH : int = 0x01;

		public static const REMOVE_NODE_LENGTH_ZERO : int = 0x02;

		public static const NODE_DOES_NOT_EXIST : int = 0x03;
		
		public function DOMError(message : String)
		{
			super(message);
		}
		
		/**
		 * Get the type of error as a string representation using the type of error.
		 * 
		 * @param type of DOMError
		 * @return String representation of the error.
		 */
		public static function getType(type : int) : String
		{
			switch(type)
			{
				case REMOVE_NODE_MISMATCH:
					return 'Remove node mismatch';
				case REMOVE_NODE_LENGTH_ZERO:
					return 'Remove node length zero';
				case NODE_DOES_NOT_EXIST:
					return 'Node does not exist';
				default:
					throw new ArgumentError('Given argument is Unknown.');  
			}
		}
		
		/**
		 * Throws an DOMError for the corresponding type. This method does all the error handling,
		 * including throwing.
		 * 
		 * @param type is Type of DOMError.
		 */
		public static function throwError(type : int) : void
		{
			switch(type)
			{
				case REMOVE_NODE_MISMATCH:
					throw new DOMError('Error trying to remove a node, that does not correspond ' +
																				'to given node');
					break;
				case REMOVE_NODE_LENGTH_ZERO:
					throw new DOMError('Error type to remove a node, where nodes length is zero');
					break;
				case NODE_DOES_NOT_EXIST:
					throw new DOMError('Node does not exist in the current IDOMElement');
					break;
				default:
					throw new ArgumentError('Given argument is Unknown.');
			}
		}
	}
}
