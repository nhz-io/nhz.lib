### test: NHZ Library: coffee ###

should = require 'should'
coffee = require '../../coffee/index'

describe 'coffee', ->
  it 'should have "mixin" function', -> coffee.mixin.should.be.an.instanceof Function
  it 'should have "nil" function', -> coffee.nil.should.be.an.instanceof Function
