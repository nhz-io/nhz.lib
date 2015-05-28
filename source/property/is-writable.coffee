### property.isWritable(obj, name [, value]) ###

descriptor = require './descriptor'

module.exports = (obj, name, value) ->
  if value?
    (d = descriptor obj, name).writable = value and true
    d.value = obj[name]
    delete d.set
    delete d.get
    descriptor obj, name, d
  return (descriptor obj, name).writable and yes
