### test: property.isConfigurable(obj, name [, value]) ###

should = require 'should'
isConfigurable = require '../../property/is-configurable'

describe 'isConfigurable(obj, name [, value])', ->
  it 'should be a function', -> isConfigurable.should.be.a.Function

  it 'should act as getter when there is no "value" argument', ->
    test = foo:1
    (isConfigurable test, 'foo').should.be.ok

  it 'should act as setter when there is a "value" argument', ->
    test = foo:1
    (isConfigurable test, 'foo', no).should.be.equal no
