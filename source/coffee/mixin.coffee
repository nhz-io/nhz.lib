### mixin(base, prototypes...) ###

module.exports = (base, prototypes...) ->
  class Mixin extends base or class Base
  for mixin in prototypes
    Mixin::[key] = value for own key, value of mixin
  return Mixin
