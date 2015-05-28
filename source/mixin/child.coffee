### Child ###

module.exports = class Child

  constructor: ->

    Object.defineProperties this,

      parent:
        configurable:yes, enumerable:yes,
        get: -> @___parent
        set: (value) -> @___parent = value

      previousSibling:
        configurable:yes, enumerable:yes
        get: ->
        set: ->

      nextSibling:
        configurable:yes, enumerable:yes
        get: ->
        set: ->

      ___is_child: configurable:no, enumerable:no, writable:no, value:yes

      ___parent: configurable:no, enumerable:no, writable:yes, value:null

  replaceWith: -> throw new Error 'UNIMPLEMENTED'

  remove: -> throw new Error 'UNIMPLEMENTED'

