### array.copy(source) ###

module.exports = (source) ->
  if source and source instanceof Array
    return Array.prototype.slice.apply source
