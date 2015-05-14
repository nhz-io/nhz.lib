should = require 'should'
error = require '../../error/index'

describe 'error', ->
  it 'should have "unimplemented" function', -> error.unimplemented.should.be.an.instanceof Function
