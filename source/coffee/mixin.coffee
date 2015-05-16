### coffee.mixin(base, prototypes...) ###

module.exports = (Base, prototypes...) ->
  class Mixin extends Base or class Base
  for mixin in prototypes
    Mixin::[key] = value for own key, value of mixin
  return Mixin
