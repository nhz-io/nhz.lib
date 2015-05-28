### test: property.getter(obj, name [, value]) ###

should = require 'should'
getter = require '../../property/getter'

describe 'getter(obj, name [, value])', ->
  it 'should be a function', -> getter.should.be.a.Function

  it 'should act as getter when there is no "value" argument', ->
    test = foo:1
    should(getter test, 'foo').not.be.ok

  it 'should act as setter when there is a "value" argument', ->
    test = foo:1
    g = ->
    (getter test, 'foo', g).should.be.equal g
