Stub = require './web-api-stub'

module.exports = class Event extends (window?.Event or Stub)
  Object.defineProperties Event,
    NONE            : configurable:no, writable:no, value:0
    CAPTURING_PHASE : configurable:no, writable:no, value:1
    AT_TARGET       : configurable:no, writable:no, value:2
    BUBBLING_PHASE  : configurable:no, writable:no, value:3

  constructor: (type, args = {}) ->
    if type
      date = Date.now()
      perf = performance?.now() or 0
      timeStamp = 1000 * date + Math.floor 1000 * (perf - Math.floor perf)

      Object.defineProperties this,
        ___stop:
          enumerable:no, configurable:yes, get: (-> no), set: (value) =>
            if value is yes then Object.defineProperty this, '___stop',
              enumerable:no, configurable:no, writable:no, value:yes

        defaultPrevented : configurable:yes, get: (-> no), set: (value) =>
          if value is yes then Object.defineProperty this, 'defaultPrevented',
            configurable:no, writable:no, value:yes

        type              : configurable:no, writable:no, value:type
        bubbles           : configurable:no, writable:no, value:(args.bubbles or no)
        cancelable        : configurable:no, writable:no, value:(args.cancelable or no)
        timeStamp         : configurable:no, writable:no, value:timeStamp

        currentTarget     : configurable:yes, writable:no, value:null
        eventPhase        : configurable:yes, writable:no, value:Event.NONE
        target            : configurable:yes, writable:no, value:null
        isTrusted         : configurable:yes, writable:no, value:no

        ___stop_immediate : configurable:yes, enumerable:no, writable:yes, value:no
    else
      throw new TypeError "Not enough arguments to Event"

  preventDefault: ->
    @defaultPrevented ||= yes if @cancelable
    return this

  stopImmediatePropagation: ->
    @___stop_immediate = yes
    return this

  stopPropagation: ->
    @___stop ||= yes
    return this

