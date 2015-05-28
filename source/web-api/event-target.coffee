### EventTarget: https://developer.mozilla.org/en-US/docs/Web/API/EventTarget ###

Stub = require './web-api-stub'
Event = require './event'

module.exports = class EventTarget extends (window?.EventTarget or Stub)
  constructor: ->
    Object.defineProperties this,
      ___listeners:
        enumerable: false,
        configurable: false,
        writable: false
        value: {}

      ___listeners_capture:
        enumerable: false,
        configurable: false,
        writable: false
        value: {}

  addEventListener: (type, listener, useCapture) ->
    if type and listener instanceof Function
      listeners = (if useCapture then @___listeners_capture else @___listeners)
      listeners = (listeners[type] ||= [])
      if -1 is listeners.indexOf listener then listeners.push listener
    return this

  removeEventListener: (type, listener, useCapture) ->
    if type and listener instanceof Function
      listeners = (if useCapture then @___listeners_capture else @___listeners)
      if (_listeners = listeners[type]) and -1 isnt idx = _listeners.indexOf listener
        _listeners.splice idx, 1
        if listeners[type].length is 0 then delete listeners[type]
    return this

  dispatchEvent: (event) ->
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

    return event.defaultPrevented
