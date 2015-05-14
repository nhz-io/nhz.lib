### test: mixin(base, prototypes...) ###

should = require 'should'
mixin = require '../../coffee/mixin'

describe 'coffee.mixin', ->
  it 'should be a function', ->
    mixin.should.be.an.instanceof Function

  it 'should return a function', ->
    mixin().should.be.an.instanceof Function

  it 'should return a constructor', ->
    class Base
    Mixin = mixin Base
    (new Mixin).should.be.an.instanceof Base

  it 'should mix in the methods from the prototypes', ->
    class Base
      base: -> true
    one = one: -> true
    two = two: -> true

    Mixin = mixin Base, one, two
    mix = new Mixin
    mix.base().should.be.ok
    mix.one().should.be.ok
    mix.two().should.be.ok
