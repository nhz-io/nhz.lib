### mixin.EventTarget ###

Event = require './event'

module.exports = class EventTarget

  constructor: ->

    Object.defineProperties this,

      ___is_event_target: configurable:no, enumerable:no, writable:no, value:yes

      ___listeners: configurable:no, enumerable:no, writable:no, value:{}

  addEventListener: (type, listener, phase = Event.BUBBLING_PHASE) ->
    if type and listener instanceof Function
      switch phase
        when Event.BUBBLING_PHASE then listeners = (@___listeners[Event.BUBBLING_PHASE] ||= [])
        when Event.CAPTURING_PHASE then listeners = (@___listeners[Event.CAPTURING_PHASE] ||= [])
        else throw new Error 'Invalid listener phase: #{phase}'
      if -1 is listeners.indexOf listener then listeners.push listener
    return this

  removeEventListener: (type, listener, phase = Event.BUBBLING_PHASE) ->
    if type and listener instanceof Function
      if phase is Event.BUBBLING_PHASE or phase is Event.CAPTURING_PHASE
        listeners = (@___listeners[phase] ||= {})
        listeners = (listeners[type] ||= [])
        if -1 isnt idx = listeners.indexOf listener then listeners.splice idx, 1
        if listeners.length is 0 then delete @___listeners[phase][type]
    return this

  dispatchEvent: (event) ->
    if event?.___is_event
      unless event.___stop or event.___stop_immediate or not event.eventPhase
        switch event.eventPhase
          when Event.AT_TARGET
            listeners = @___listeners[event.type]
            captureListeners = @___listeners_capture[event.type]
          when Event.CAPTURING_PHASE
            captureListeners = @___listeners_capture[event.type]
          when Event.BUBBLING_PHASE
            listeners = @___listeners[event.type]
          else throw new Error "Invalid eventPhase: #{event.eventPhase or 'null'}"

        if listeners?.length then for listener in listeners
          listener.call this, event
          if event.___stop or event.___stop_immediate then return event.defaultPrevented

        if captureListeners?.length then for listener in captureListeners
          listener.call this, event
          break if event.___stop or event.___stop_immediate
    return this
