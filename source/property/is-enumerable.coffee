### property.isEnumerable(obj, name [, value]) ###

descriptor = require './descriptor'

module.exports = (obj, name, value) ->
  if value?
    (d = descriptor obj, name).enumerable = value and true
    descriptor obj, name, d
  return (descriptor obj, name).enumerable and yes
