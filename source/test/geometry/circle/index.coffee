### test: NHZ Library: geometry.circle ###

should = require 'should'
circle = require '../../../geometry/circle/index'

describe 'circle', ->
  it 'should have "has" function', -> circle.has.should.be.an.instanceof Function

