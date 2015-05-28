### property.isEnumerable(obj, name [, value]) ###

descriptor = require './descriptor'

module.exports = (obj, name, value) ->
  if value?
    (d = descriptor obj, name).enumerable = value and yes
    descriptor obj, name, d
  return (descriptor obj, name).enumerable or no
