### test: NHZ Library: array ###

should = require 'should'
array = require '../../array/index'

describe 'array', ->
  it 'should have "copy" function', -> array.copy.should.be.an.instanceof Function
