### mixin.EventTarget ###

Event = require './event'

module.exports = class EventTarget extends require './base'

  constructor: ->

    Object.defineProperties this,

      ___is_event_target: configurable:no, enumerable:no, writable:no, value:yes

      ___listeners: configurable:no, enumerable:no, writable:no, value:{}

  addEventListener: (type, listener, phase = Event.BUBBLING_PHASE) ->
    if type and type.length and (typeof type is 'string') and listener instanceof Function
      if phase is Event.BUBBLING_PHASE or phase is Event.CAPTURING_PHASE
        listeners = (@___listeners[phase] ||= {})
        listeners = (listeners[type] ||= [])
        if -1 is listeners.indexOf listener then listeners.push listener
    return this

  removeEventListener: (type, listener, phase = Event.BUBBLING_PHASE) ->
    if type and type.length and (typeof type is 'string') and listener instanceof Function
      if phase is Event.BUBBLING_PHASE or phase is Event.CAPTURING_PHASE
        if listeners = @___listeners[phase]
          if listeners = listeners[type]
            if -1 isnt idx = listeners.indexOf listener then listeners.splice idx, 1
            if listeners.length is 0 then delete @___listeners[phase][type]
    return this

  dispatchEvent: (event) ->
    if event?.___is_event and (type = event.type)
      if event.target is this
        phase = event.___phase = Event.BUBBLING_PHASE
      else
        unless phase = event.phase then phase = event.___phase = Event.CAPTURING_PHASE
      if listeners = @___listeners[phase]?[type]
        for listener in listeners
          break if event.stopped or event.stoppedImmediate
          listener.call this, event
    return this
