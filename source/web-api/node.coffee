### Node: https://developer.mozilla.org/en-US/docs/Web/API/Node ###

EventTarget = require './event-target'
UNIMPLEMENTED = require '../error/unimplemented'

module.exports = class Node extends EventTarget
  Object.defineProperties Node,
    ELEMENT_NODE                : configurable:no, writable:no, value:1
    TEXT_NODE                   : configurable:no, writable:no, value:3
    PROCESSING_INSTRUCTION_NODE : configurable:no, writable:no, value:7
    COMMENT_NODE                : configurable:no, writable:no, value:8
    DOCUMENT_NODE               : configurable:no, writable:no, value:9
    DOCUMENT_TYPE_NODE          : configurable:no, writable:no, value:10
    DOCUMENT_FRAGMENT_NODE      : configurable:no, writable:no, value:11

  constructor: (args = {}) ->
    super()
    type = args.type or args.nodeType or Node.ELEMENT_NODE
    name = args.name or args.nodeName or 'node'

    Object.defineProperties this,
      baseURI           : configurable:no, writable:no, value:null
      childNodes        : configurable:no, writable:no, value:null
      firstChild        : configurable:no, writable:no, value:null
      lastChild         : configurable:no, writable:no, value:null
      nextSibling       : configurable:no, writable:no, value:null
      nodeName          : configurable:no, writable:no, value:name
      nodeType          : configurable:no, writable:no, value:type
      nodeValue         : configurable:no, writable:no, value:null
      ownerDocument     : configurable:no, writable:no, value:null
      parentNode        : configurable:no, writable:no, value:null
      parentElement     : configurable:no, writable:no, value:null
      previousSibling   : configurable:no, writable:no, value:null
      textContent       : configurable:no, writable:yes, value:null

  appendChild: -> throw UNIMPLEMENTED()

  cloneNode: -> throw UNIMPLEMENTED()

  compareDocumentProsition: -> throw UNIMPLEMENTED()

  contains: -> throw UNIMPLEMENTED()

  hasChildNodes: -> throw UNIMPLEMENTED()

  insertBefore: -> throw UNIMPLEMENTED()

  isDefaultNamespace: -> throw UNIMPLEMENTED()

  isEqualNode: -> throw UNIMPLEMENTED()

  lookupPrefix: -> throw UNIMPLEMENTED()

  lookupNamespaceUri: -> throw UNIMPLEMENTED()

  normalize: -> throw UNIMPLEMENTED()

  removeChild: -> throw UNIMPLEMENTED()

  replaceChild: -> throw UNIMPLEMENTED()
