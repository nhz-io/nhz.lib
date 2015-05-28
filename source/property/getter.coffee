### property.getter(obj, name [, value]) ###

descriptor = require './descriptor'

module.exports = (obj, name, value) ->
  if value?
    (d = descriptor obj, name).get = value
    delete d.value
    delete d.writable
    descriptor obj, name, d
  return (descriptor obj, name).get
