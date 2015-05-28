### property.descriptor(obj, name [, descriptor]) ###

module.exports = (obj, name, descriptor) ->
  if descriptor then Object.defineProperty obj, name, descriptor
  return Object.getOwnPropertyDescriptor obj, name
