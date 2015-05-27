### Extendable EventTarget: https://developer.mozilla.org/en-US/docs/Web/API/EventTarget ###

module.exports = class EventTarget extends window.EventTarget
  constructor: (target) ->
    if target instanceof window.EventTarget
      target = target.__event_target or target
    else
      target = (if typeof target is 'string' and target.length then target else 'div')
      target = document.createElement target

    Object.defineProperties this,
      __event_listeners:
        enumerable: false,
        configurable: false,
        writable: false
        value: {}

      __event_listener_wrappers:
        enumerable: false,
        configurable: false,
        writable: false
        value: {}

      __event_target:
        enumerable: false,
        configurable: false,
        writable: false
        value: target

  addEventListener: (type, listener, useCapture, wantsUntrusted) ->
    if type and listener
      listeners = @__event_listeners[type] ||= []
      wrappers = @__event_listener_wrappers[type] ||= []
      if -1 isnt id = listeners.indexOf listener
        listener = wrappers[id]
      else
        listeners.push listener
        listener = do(listener) => ( => listener.apply this, arguments)
        wrappers.push listener

    @__event_target.addEventListener type, listener, useCapture, wantsUntrusted
    return this

  removeEventListener: (type, listener, useCapture) ->
    if type and listener and listeners = @__event_listeners[type]
      wrappers = @__event_listener_wrappers[type]
      if -1 isnt id = listeners.indexOf listener
        listener = wrappers[id]
        listeners.splice id, 1
        wrappers.splice id, 1

    @__event_target.removeEventListener type, listener, useCapture

  dispatchEvent: -> @__event_target.dispatchEvent.apply @__event_target, arguments
