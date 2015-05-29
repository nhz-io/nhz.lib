### Component ###

Base = require './base'
Child = require './child'
Parent = require './parent'
EventSource = require './event-source'
EventTarget = require './event-target'


module.exports = class Component extends [ Base, Child, Parent, EventSource, EventTarget ]

  constructor: ->
    super
    Object.defineProperties this,
      ___is_component: configurable:no, enumerable:no, writable:no, value:yes

  appendChild: (child) -> if child?.___is_component then super else this

  removeChild: (child) -> if child?.___is_component then super else this

  replaceChild: (child, withChild) ->
    if child?.___is_component and withChild?.___is_component then super else this

  nextChild: (child) -> if child?.___is_component then super else null

  previousChild: (child) -> if child?.___is_component then super else null

  insertBefore: (child, newChild) ->
    if child?.___is_component and newChild?.___is_component then super else this

  insertAfter: (child, newChild) ->
    if child?.___is_component and newChild?.___is_component then super else this

  hasChild: (child) -> if child?.___is_component then super else null


  dispatchEvent: (event) -> super
