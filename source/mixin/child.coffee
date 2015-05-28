### Child ###

module.exports = class Child

  constructor: ->

    Object.defineProperties this,

      parent:
        configurable:yes, enumerable:yes,
        get: -> @___parent
        set: (value) =>
          parent = @___parent
          if value?
            if value.___is_parent and value isnt parent
              @___parent = null
              parent?.removeChild? this
              @___parent = value
              value.appendChild? this
          else
            @___parent = null
            parent?.removeChild this

          return @___parent

      previousSibling:
        configurable:yes, enumerable:yes
        get: -> if parent = @___parent then parent.previousChild this else null


      nextSibling:
        configurable:yes, enumerable:yes
        get: -> if parent = @___parent then parent.nextChild this else null

      ___is_child: configurable:no, enumerable:no, writable:no, value:yes

      ___parent: configurable:no, enumerable:no, writable:yes, value:null

  replaceWith: -> throw new Error 'UNIMPLEMENTED'

  remove: -> throw new Error 'UNIMPLEMENTED'

