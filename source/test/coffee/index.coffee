### test: NHZ Library: coffee ###

should = require 'should'
coffee = require '../../coffee/index'

describe 'coffee', ->
  it 'should have "genClassTests" function', -> coffee.genClassTests.should.be.a.Function
  it 'should have "genClass" function', -> coffee.genClass.should.be.a.Function
