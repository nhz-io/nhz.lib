### mixin.Parent ###

module.exports = class Parent

  constructor: ->

    Object.defineProperties this,

      children: configurable:yes, enumerable:yes, get: -> @___children.slice()

      ___children: configurable:no, enumerable:no, writable:no, value:[]

      ___is_parent: configurable:no, enumerable:no, writable:no, value:yes

  appendChild: -> throw new Error 'UNIMPLEMENTED'

  removeChild: -> throw new Error 'UNIMPLEMENTED'

  replaceChild: -> throw new Error 'UNIMPLEMENTED'

  firstChild: -> throw new Error 'UNIMPLEMENTED'

  lastChild: -> throw new Error 'UNIMPLEMENTED'

  nextChild: -> throw new Error 'UNIMPLEMENTED'

  previousChild: -> throw new Error 'UNIMPLEMENTED'

  insertBefore: -> throw new Error 'UNIMPLEMENTED'

  insertAfter: -> throw new Error 'UNIMPLEMENTED'

  hasChild: -> throw new Error 'UNIMPLEMENTED'
