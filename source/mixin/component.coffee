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

