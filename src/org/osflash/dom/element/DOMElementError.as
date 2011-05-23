package org.osflash.dom.element
{
	/**
	 * @author Simon Richardson - me@simonrichardson.info
	 */
	public class DOMElementError extends Error
	{
		
		public static const REMOVE_NODE_MISMATCH : int = 0x01;

		public static const REMOVE_NODE_LENGTH_ZERO : int = 0x02;

		public static const NODE_DOES_NOT_EXIST : int = 0x03;
		
		public static const NODE_ALREADY_EXISTS : int = 0x04;

		public static const NODE_NAME_UNDEFINED : int = 0x05;

		public static const NODE_NAME_INVALID : int = 0x06;
		
		public function DOMElementError(message : String)
		{
			super(message);
		}
		
		/**
		 * Get the type of error as a string representation using the type of error.
		 * 
		 * @param type of DOMElementError
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
				case NODE_ALREADY_EXISTS:
					return 'Node already exists';
				case NODE_NAME_UNDEFINED:
					return 'Node name undefined';
				case NODE_NAME_INVALID:
					return 'Node name is invalid';
				default:
					throw new ArgumentError('Given argument is Unknown.');  
			}
		}
		
		/**
		 * Throws an DOMElementError for the corresponding type. This method does all the error 
		 * handling, including throwing.
		 * 
		 * @param type is Type of DOMError.
		 */
		public static function throwError(type : int) : void
		{
			switch(type)
			{
				case REMOVE_NODE_MISMATCH:
					throw new DOMElementError('Error trying to remove a node, that does not ' +
														 				'correspond to given node');
					break;
				case REMOVE_NODE_LENGTH_ZERO:
					throw new DOMElementError('Error type to remove a node, where nodes length ' + 
																						'is zero');
					break;
				case NODE_DOES_NOT_EXIST:
					throw new DOMElementError('Node does not exist in the current IDOMElement');
					break;
				case NODE_ALREADY_EXISTS:
					throw new DOMElementError('Node already exists in the current IDOMElement');
					break;
				case NODE_NAME_UNDEFINED:
					throw new DOMElementError('Node name is undefined');
					break;
				case NODE_NAME_INVALID:
					throw new DOMElementError('Node name is invalid');
					break;
				default:
					throw new ArgumentError('Given argument is Unknown.');
			}
		}
	}
}
