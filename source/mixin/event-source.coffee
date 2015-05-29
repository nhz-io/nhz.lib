### EventSource ###

module.exports = class EventSource extends require './base'

  constructor: ->

    Object.defineProperties this,

      ___is_event_source: configurable:no, enumerable:no, writable:no, value:yes

