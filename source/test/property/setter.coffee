### test: property.setter(obj, name [, value]) ###

should = require 'should'
setter = require '../../property/setter'

describe 'setter(obj, name [, value])', ->
  it 'should be a function', -> setter.should.be.a.Function

  it 'should act as setter when there is no "value" argument', ->
    test = foo:1
    should(setter test, 'foo').not.be.ok

  it 'should act as setter when there is a "value" argument', ->
    test = foo:1
    g = ->
    (setter test, 'foo', g).should.be.equal g
