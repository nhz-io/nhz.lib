### mixin.Event ###

module.exports = class Event extends require './base'
  Object.defineProperties Event,

    CAPTURING_PHASE : configurable:no, enumerable:yes, writable:no, value:1
    BUBBLING_PHASE  : configurable:no, enumerable:yes, writable:no, value:3
    DEFAULT_TYPE    : configurable:no, enumerable:yes, writable:no, value:'event'

  constructor: (type = Event.DEFAULT_TYPE) ->
    date = Date.now()
    perf = performance?.now() or 0
    timestamp = 1000 * date + Math.floor 1000 * (perf - Math.floor perf)

    Object.defineProperties this,

      ___is_event: configurable:no, enumerable:no, writable:no, value:yes

      ___type: configurable:no, enumerable:no, writable:yes, value:type

      ___timestamp: configurable:no, enumerable:no, writable:yes, value:timestamp

      ___source: configurable:no, enumerable:no, writable:yes, value:null

      ___target: configurable:no, enumerable:no, writable:yes, value:null

      ___phase: configurable:no, enumerable:no, writable:yes, value:null

      ___canceled: configurable:no, enumerable:no, writable:yes, value:no

      ___stopped: configurable:no, enumerable:no, writable:yes, value:no

      ___stopped_immediate: configurable:no, enumerable:no, writable:yes, value:no

      ___callback: configurable:no, enumerable:no, writable:yes, value:null

      type: configurable:yes, enumerable:yes, get: => @___type

      timestamp: configurable:yes, enumerable:yes, get: => @___timestamp

      source: configurable:yes, enumerable:yes, get: => @___source

      target:
        configurable:yes, enumerable:yes
        get: => @___target
        set: (value) -> if (not @___target) and value?.___is_event_target then @___target = value

      phase: configurable:yes, enumerable:yes, get: => @___phase

      canceled: configurable:yes, enumerable:yes, get: => @___canceled

      stopped: configurable:yes, enumerable:yes, get: => @___stopped

      stoppedImmediate: configurable:yes, enumerable:yes, get: => @___stopped_immediate

      callback:
        configurable:yes, enumerable:yes
        get: => @___callback
        set: (value) => if (not @___callback) and typeof value is 'function' then @___callback = value

  cancel: ->
    @___canceled = yes
    return this

  stop: ->
    @___stopped = yes
    return this

  stopImmediate: ->
    @___stopped_immediate = yes
    return this

