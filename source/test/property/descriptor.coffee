### test: property.descriptor(obj, name [, value]) ###

should = require 'should'
descriptor = require '../../property/descriptor'

describe 'descriptor(obj, name [, value])', ->
  it 'should be a function', -> descriptor.should.be.a.Function

  it 'should act as getter when there is no value argument', ->
    test = foo:1
    result = descriptor test, 'foo'
    result.value.should.be.equal 1
    result.enumerable.should.be.equal yes
    result.writable.should.be.equal yes
    result.configurable.should.be.equal yes

  it 'should act as setter when there is a value argument', ->
    test = foo:1
    result = descriptor test, 'foo', enumerable:no, configurable:no, writable:no, value:0
    result.value.should.be.equal 0
    result.enumerable.should.be.equal no
    result.writable.should.be.equal no
    result.configurable.should.be.equal no
