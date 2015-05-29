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
            if value isnt parent and value.___is_parent
              @___parent = null
              parent?.removeChild? this
              @___parent = value
              value.appendChild? this
          else
            @___parent = null
            parent?.removeChild? this

          return @___parent

      previousSibling:
        configurable:yes, enumerable:yes
        get: -> if parent = @___parent then parent.previousChild? this else null

      nextSibling:
        configurable:yes, enumerable:yes
        get: -> if parent = @___parent then parent.nextChild? this else null

      ___is_child: configurable:no, enumerable:no, writable:no, value:yes

      ___parent: configurable:no, enumerable:no, writable:yes, value:null

  replaceWith: (child) ->
    if child and child isnt this and child.___is_child and @___parent
      if @___parent isnt parent = child.___parent
        child.___parent = null
        parent?.removeChild? child
        parent = child.___parent = @___parent
        @___parent = null
        parent.replaceChild? this, child
    return this

  remove: ->
    if parent = @___parent
      @___parent = null
      parent.removeChild? this
    return this

