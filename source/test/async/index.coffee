### test: NHZ Library: async ###

should = require 'should'
async = require '../../async/index'

describe 'async', ->
  it 'should have "parallel" function', -> async.parallel.should.be.an.instanceof Function
