### test: NHZ Library: geometry.rectangle ###

should = require 'should'
rectangle = require '../../../geometry/rectangle/index'

describe 'rectangle', ->
  it 'should have "has" function', -> rectangle.has.should.be.an.instanceof Function

