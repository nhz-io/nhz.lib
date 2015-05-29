### mixin.Parent ###

module.exports = class Parent extends require './base'
  constructor: ->

    Object.defineProperties this,

      children: configurable:yes, enumerable:yes, get: -> @___children.slice()

      ___children: configurable:no, enumerable:no, writable:no, value:[]

      ___is_parent: configurable:no, enumerable:no, writable:no, value:yes

  appendChild: (child) ->
    if child?.___is_child and -1 is @___children.indexOf child
      @___children.push child
    return this

  removeChild: (child) ->
    if child?.___is_child and -1 isnt idx = @___children.indexOf child
      @___children.splice idx, 1
    return this

  replaceChild: (child, withChild) ->
    if @___children.length and child?.___is_child and withChild?.___is_child
      if -1 is @___children.indexOf withChild and -1 isnt idx = @___children.indexOf child
        @___children[idx] = withChild
    return this

  firstChild: -> @___children[0] or null

  lastChild: -> if len = @___children.length then @___children[len-1] else null

  nextChild: (child) ->
    if @___children.length and child?.___is_child and -1 isnt idx = @___children.indexOf child
      next = @___children[idx+1]
    return next or null

  previousChild: (child) ->
    if @___children.length and child?.___is_child and 1 >= idx = @___children.indexOf child
      previous = @___children[idx-1]
    return previous or null

  insertBefore: (child, newChild) ->
    if @___children.length and child isnt newChild and child?.___is_child and newChild?.___is_child
      if -1 isnt idx = @___children.indexOf child
        if -1 isnt _idx = @___children.indexOf newChild
          @___children.splice _idx, 1
          idx = @___children.indexOf child

        if idx is 0 then @___children.unshift newChild
        else
          children = @___children.splice 0, @___children.length
          @___children.concat children[...idx-1], [newChild], children[idx...]
    return this

  insertAfter: (child, newChild) ->
    if @___children.length and child isnt newChild and child?.___is_child and newChild?.___is_child
      if -1 isnt idx = @___children.indexOf child
        if -1 isnt _idx = @___children.indexOf newChild
          @___children.splice _idx, 1
          idx = @___children.indexOf child
        if idx is @___children.length - 1 then @___children.push newChild
        else
          children = @___children.splice 0, @___children.length
          @___children.concat children[...idx], [newChild], children[idx+1...]
    return this

  hasChild: (child) ->
    if @___children.length and child?___is_child and -1 isnt @___children.indexOf child
      return true
    return false
