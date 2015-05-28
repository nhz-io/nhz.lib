### Child ###

module.exports = class Child

  constructor: ->

    Object.defineProperties this,

      parent:
        configurable:yes, enumerable:yes,
        get: ->
        set: ->

      previousSibling:
        configurable:yes, enumerable:yes
        get: ->
        set: ->

      nextSibling:
        configurable:yes, enumerable:yes
        get: ->
        set: ->

      ___is_child: configurable:no, enumerable:no, writable:yes, value:null

      ___parent: configurable:no, enumerable:no, writable:yes, value:null

  replaceWith: -> throw new Error 'UNIMPLEMENTED'

  remove: -> throw new Error 'UNIMPLEMENTED'

