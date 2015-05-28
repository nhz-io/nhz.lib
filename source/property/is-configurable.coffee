### property.isConfigurable(obj, name [, value]) ###

descriptor = require './descriptor'

module.exports = (obj, name, value) ->
  if value?
    (d = descriptor obj, name).configurable = value and true
    descriptor obj, name, d
  return (descriptor obj, name).configurable and yes
