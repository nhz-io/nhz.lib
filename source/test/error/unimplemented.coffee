should = require 'should'
unimplemented = require '../../error/unimplemented'

describe 'error.unimplemented', ->
  it 'should return an error', -> unimplemented().should.be.an.instanceof Error
