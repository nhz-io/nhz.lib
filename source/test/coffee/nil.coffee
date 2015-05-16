### test: coffee.nil() ###

should = require 'should'
nil = require '../../coffee/nil'

describe 'coffee.nil', ->
  it 'should be a function', ->
    nil.should.be.an.instanceof Function
  it 'should return itself', ->
    nil().should.be.equal nil
