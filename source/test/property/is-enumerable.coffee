### test: property.isEnumerable(obj, name [, value]) ###

should = require 'should'
isEnumerable = require '../../property/is-enumerable'

describe 'isEnumerable(obj, name [, value])', ->
  it 'should be a function', -> isEnumerable.should.be.a.Function

  it 'should act as getter when there is no "value" argument', ->
    test = foo:1
    (isEnumerable test, 'foo').should.be.ok

  it 'should act as setter when there is a "value" argument', ->
    test = foo:1
    (isEnumerable test, 'foo', no).should.be.equal no
