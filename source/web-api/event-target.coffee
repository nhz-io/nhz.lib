### EventTarget: https://developer.mozilla.org/en-US/docs/Web/API/EventTarget ###

Stub = require './web-api-stub'
Event = require './event'

module.exports = class EventTarget extends (window?.EventTarget or Stub)
  constructor: ->
    Object.defineProperties this,
      ___listeners_bubble:
        enumerable: false,
        configurable: false,
        writable: false
        value: {}

      ___listeners_capture:
        enumerable: false,
        configurable: false,
        writable: false
        value: {}

  addEventListener: (type, listener, useCapture, wantsUntrusted) ->
    if type and listener instanceof Function
      listeners = (if useCapture then @___listeners_capture else @___listeners_bubble)
      listeners = (listeners[type] ||= [])
      if -1 is listeners.indexOf listener then listeners.push listener
    return this

  removeEventListener: (type, listener, useCapture) ->
    if type and listener instanceof Function
      listeners = (if useCapture then @___listeners_capture else @___listeners_bubble)
      if listeners = listeners[type] and -1 isnt idx = listeners.indexOf listener
        listeners.splice idx, 1
    return this

  dispatchEvent: (event) ->
    if event instanceof Event
      event.__stop_immediate = no
      phase = event.eventPhase
      switch
        when phase is Event.NONE then event.eventPhase = Event.CAPTURING_PHASE
        when phase is Event.CAPTURING_PHASE or phase is Event.AT_TARGET
          listeners = @___listeners_capture[event.type]
        when phase is Event.BUBBLING_PHASE
          listeners = @___listeners_bubble[event.type]
        else throw new Error "Invalid eventPhase: #{phase or 'null'}"

      if listeners?.length then for listener in listeners
        listener.apply this, event
        break if event.___stop or event.___stop_immediate

      if phase is Event.AT_TARGET and event.bubbles
        Object.defineProperty event, 'eventPhase',
          configurable:yes, writable:no, value: Event.BUBBLING_PHASE

    return event.defaultPrevented

