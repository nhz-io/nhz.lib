### test: NHZ Library: object ###

should = require 'should'
object = require '../../object/index'

describe 'object', ->
  it 'should have "copy" function', -> object.copy.should.be.an.instanceof Function
