package org.osflash.dom.element.utils
{
	import org.osflash.dom.dom_namespace;
	import org.osflash.dom.element.DOMElement;
	import org.osflash.dom.element.IDOMElement;
	import org.osflash.dom.element.IDOMNode;

	import flash.utils.getQualifiedClassName;
	/**
	 * @author Simon Richardson - simon@ustwo.co.uk
	 */
	public function describeDOM(element : IDOMElement) : XML
	{
		const dom : XML = <dom />;
		
		var i : int;
		var total : int;
		var node : IDOMNode;
		var children : Vector.<IDOMNode>;
		
		if (element.numChildren > 0)
		{
			var nodeXML : XML;
			var nodeName : String;
			var nodeDOM : XMLList;
			var nodeChildren : XML;
			var nodeClassName : String;
			var nodeClassNameIndex : int;
			
			
			const domElement : DOMElement = element as DOMElement;
			if(null == domElement)
			{
				// Try and go through the interface (slower)
				total = element.numChildren;
				for (i = 0; i < total; i++)
				{
					node = element.getAt(i);
					
					nodeClassName = getQualifiedClassName(node);
					nodeClassNameIndex = nodeClassName.lastIndexOf(':');
					nodeName = nodeClassName.substr(nodeClassNameIndex + 1);
					
					nodeXML = <{nodeName} />;
					
					if(null != node.id) nodeXML.@id = node.id;
					if(null != node.name) nodeXML.@name = node.name;
					if(!isNaN(node.index)) nodeXML.@index = node.index;
					
					nodeXML.@type = node.type.type;
					nodeXML.@path = node.path;
					
					nodeChildren = describeDOM(node);
					nodeDOM = nodeChildren.child('*');
					if(null != nodeDOM && nodeDOM.length() > 0) nodeXML.appendChild(nodeDOM);
					
					dom.appendChild(nodeXML);
				}
			}
			else
			{
				use namespace dom_namespace;
				
				// Try and go through the fast via namespace
				const nodes : Vector.<IDOMNode> = domElement.children;
				total = nodes.length;
				for (i = 0; i < total; i++)
				{
					node = nodes[i];
					
					nodeClassName = getQualifiedClassName(node);
					nodeClassNameIndex = nodeClassName.lastIndexOf(':');
					nodeName = nodeClassName.substr(nodeClassNameIndex + 1);
					
					nodeXML = <{nodeName} />;
					
					if(null != node.id) nodeXML.@id = node.id;
					if(null != node.name) nodeXML.@name = node.name;
					if(!isNaN(node.index)) nodeXML.@index = node.index;
					
					nodeXML.@type = node.type.type;
					nodeXML.@path = node.path;
					
					nodeChildren = describeDOM(node);
					nodeDOM = nodeChildren.child('*');
					if(null != nodeDOM && nodeDOM.length() > 0) nodeXML.appendChild(nodeDOM);
					
					dom.appendChild(nodeXML);
				}
			}
		}
		
		return dom;
	}
}
