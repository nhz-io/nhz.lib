### EventSource ###

module.exports = class EventSource extends require './base'

  constructor: ->

    Object.defineProperties this,

      ___is_event_source: configurable:no, enumerable:no, writable:no, value:yes

  emitEvent: (event, target) ->
    if event?.___is_event and target?.___is_event_target
      event.source = this
      event.target = target
      target.dispatchEvent? event
      unless event.canceled? then event.callback? event
    return this


