### browser.NextAnimationFrame(callbacks...) ###
module.exports = class NextAnimationFrame
  constructor: (callbacks...) ->
    return (new NextAnimationFrame callbacks).start() unless this instanceof NextAnimationFrame
    @callbacks = (if callbacks[0] instanceof Array then callbacks[0] else callbacks)

  start: ->
    requestAnimationFrame (elapsed) =>
      callback? elapsed for callback in @callbacks
      @next?.start?()
    return this

  then: (callbacks...) -> @next = new NextAnimationFrame callbacks
