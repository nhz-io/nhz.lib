### object.copy(source) ###

module.exports = (source) ->
  if source and source instanceof Object
    result = {}
    result[key] = value for own key, value of source
    return result
