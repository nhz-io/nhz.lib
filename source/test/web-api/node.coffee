### test: web-api.Node(args) ###

should = require 'should'
Node = require '../../web-api/node'
EventTarget = require '../../web-api/event-target'

describe 'Node(args)', ->
  it 'should be a class', ->
    Node.should.be.a.Function
    Node::constructor.should.be.equal Node

  it 'should have "ELEMENT_NODE" property', -> Node.should.have.property "ELEMENT_NODE"
  it 'should have "TEXT_NODE" property', -> Node.should.have.property "TEXT_NODE"
  it 'should have "PROCESSING_INSTRUCTION_NODE" property', -> Node.should.have.property "PROCESSING_INSTRUCTION_NODE"
  it 'should have "COMMENT_NODE" property', -> Node.should.have.property "COMMENT_NODE"
  it 'should have "DOCUMENT_NODE" property', -> Node.should.have.property "DOCUMENT_NODE"
  it 'should have "DOCUMENT_TYPE_NODE" property', -> Node.should.have.property "DOCUMENT_TYPE_NODE"
  it 'should have "DOCUMENT_FRAGMENT_NODE" property', -> Node.should.have.property "DOCUMENT_FRAGMENT_NODE"

  describe '#constructor(args)', ->
    it 'should return an instance of Node', -> (new Node).should.be.an.instanceof Node
    it 'should return an instance of EventTarget', -> (new Node).should.be.an.instanceof EventTarget

    it 'should set the node type', ->
      (new Node type:Node.PROCESSING_INSTRUCTION_NODE).nodeType.should.be.equal Node.PROCESSING_INSTRUCTION_NODE

    it 'should set the node name', ->
      (new Node name:'test').nodeName.should.be.equal 'test'

    it 'should set the default node type (ELEMENT_NODE)', ->
      (new Node).nodeType.should.be.equal Node.ELEMENT_NODE

    it 'should set the default node name (node)', ->
      (new Node).nodeName.should.be.equal 'node'

  describe 'instance', ->
    it 'should have "baseURI" property', -> (new Node 'test').should.have.property "baseURI"
    it 'should have "childNodes" property', -> (new Node 'test').should.have.property "childNodes"
    it 'should have "firstChild" property', -> (new Node 'test').should.have.property "firstChild"
    it 'should have "lastChild" property', -> (new Node 'test').should.have.property "lastChild"
    it 'should have "nextSibling" property', -> (new Node 'test').should.have.property "nextSibling"
    it 'should have "nodeName" property', -> (new Node 'test').should.have.property "nodeName"
    it 'should have "nodeType" property', -> (new Node 'test').should.have.property "nodeType"
    it 'should have "nodeValue" property', -> (new Node 'test').should.have.property "nodeValue"
    it 'should have "ownerDocument" property', -> (new Node 'test').should.have.property "ownerDocument"
    it 'should have "parentNode" property', -> (new Node 'test').should.have.property "parentNode"
    it 'should have "parentElement" property', -> (new Node 'test').should.have.property "parentElement"
    it 'should have "previousSibling" property', -> (new Node 'test').should.have.property "previousSibling"
    it 'should have "textContent" property', -> (new Node 'test').should.have.property "textContent"

    it 'should have "appendChild()" method', -> (new Node 'test').appendChild.should.be.a.Function
    it 'should have "cloneNode()" method', -> (new Node 'test').cloneNode.should.be.a.Function
    it 'should have "compareDocumentProsition()" method', -> (new Node 'test').compareDocumentProsition.should.be.a.Function
    it 'should have "contains()" method', -> (new Node 'test').contains.should.be.a.Function
    it 'should have "hasChildNodes()" method', -> (new Node 'test').hasChildNodes.should.be.a.Function
    it 'should have "insertBefore()" method', -> (new Node 'test').insertBefore.should.be.a.Function
    it 'should have "isDefaultNamespace()" method', -> (new Node 'test').isDefaultNamespace.should.be.a.Function
    it 'should have "isEqualNode()" method', -> (new Node 'test').isEqualNode.should.be.a.Function
    it 'should have "lookupPrefix()" method', -> (new Node 'test').lookupPrefix.should.be.a.Function
    it 'should have "lookupNamespaceUri()" method', -> (new Node 'test').lookupNamespaceUri.should.be.a.Function
    it 'should have "normalize()" method', -> (new Node 'test').normalize.should.be.a.Function
    it 'should have "removeChild()" method', -> (new Node 'test').removeChild.should.be.a.Function
    it 'should have "replaceChild()" method', -> (new Node 'test').replaceChild.should.be.a.Function

    describe '#appendChild()', ->
      it 'should throw "UNIMPLEMENTED"', -> (->(new Node).appendChild()).should.throw 'UNIMPLEMENTED'
    describe '#cloneNode()', ->
      it 'should throw "UNIMPLEMENTED"', -> (->(new Node).cloneNode()).should.throw 'UNIMPLEMENTED'
    describe '#compareDocumentProsition()', ->
      it 'should throw "UNIMPLEMENTED"', -> (->(new Node).compareDocumentProsition()).should.throw 'UNIMPLEMENTED'
    describe '#contains()', ->
      it 'should throw "UNIMPLEMENTED"', -> (->(new Node).contains()).should.throw 'UNIMPLEMENTED'
    describe '#hasChildNodes()', ->
      it 'should throw "UNIMPLEMENTED"', -> (->(new Node).hasChildNodes()).should.throw 'UNIMPLEMENTED'
    describe '#insertBefore()', ->
      it 'should throw "UNIMPLEMENTED"', -> (->(new Node).insertBefore()).should.throw 'UNIMPLEMENTED'
    describe '#isDefaultNamespace()', ->
      it 'should throw "UNIMPLEMENTED"', -> (->(new Node).isDefaultNamespace()).should.throw 'UNIMPLEMENTED'
    describe '#isEqualNode()', ->
      it 'should throw "UNIMPLEMENTED"', -> (->(new Node).isEqualNode()).should.throw 'UNIMPLEMENTED'
    describe '#lookupPrefix()', ->
      it 'should throw "UNIMPLEMENTED"', -> (->(new Node).lookupPrefix()).should.throw 'UNIMPLEMENTED'
    describe '#lookupNamespaceUri()', ->
      it 'should throw "UNIMPLEMENTED"', -> (->(new Node).lookupNamespaceUri()).should.throw 'UNIMPLEMENTED'
    describe '#normalize()', ->
      it 'should throw "UNIMPLEMENTED"', -> (->(new Node).normalize()).should.throw 'UNIMPLEMENTED'
    describe '#removeChild()', ->
      it 'should throw "UNIMPLEMENTED"', -> (->(new Node).removeChild()).should.throw 'UNIMPLEMENTED'
    describe '#replaceChild()', ->
      it 'should throw "UNIMPLEMENTED"', -> (->(new Node).replaceChild()).should.throw 'UNIMPLEMENTED'
