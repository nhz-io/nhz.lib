### test: property.isWritable(obj, name [, value]) ###

should = require 'should'
isWritable = require '../../property/is-writable'

describe 'isWritable(obj, name [, value])', ->
  it 'should be a function', -> isWritable.should.be.a.Function

  it 'should act as getter when there is no "value" argument', ->
    test = foo:1
    (isWritable test, 'foo').should.be.ok

  it 'should act as setter when there is a "value" argument', ->
    test = foo:1
    (isWritable test, 'foo', no).should.be.equal no
