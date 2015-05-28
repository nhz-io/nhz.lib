### property.isConfigurable(obj, name [, value]) ###

descriptor = require './descriptor'

module.exports = (obj, name, value) ->
  if value?
    (d = descriptor obj, name).configurable = value and yes
    descriptor obj, name, d
  return (descriptor obj, name).configurable or no
