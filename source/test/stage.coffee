# Browser emulation test stage

module.exports = do ($ = global or {}) ->
  $.window = {}

  $.window.EventTarget = class EventTarget
    addEventListener: -> throw new Error 'UNIMPLEMENTED'
    removeEventListener: -> throw new Error 'UNIMPLEMENTED'
    dispatchEvent: -> throw new Error 'UNIMPLEMENTED'

  $.window.HTMLElement = class HTMLElement extends EventTarget
    constructor: (@nodeName) ->

  $.window.document = $.document =
    createElement: (nodeName) -> new HTMLElement nodeName

  $.requestAnimationFrame = $.window.requestAnimationFrame = (callback) -> setTimeout callback
