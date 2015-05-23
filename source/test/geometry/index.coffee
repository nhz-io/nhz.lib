### test: NHZ Library: geometry ###

should = require 'should'
geometry = require '../../geometry/index'

describe 'geometry', ->
  it 'should have "rectangle" namespace', -> geometry.rectangle.should.be.an.instanceof Object
  it 'should have "circle" namespace', -> geometry.circle.should.be.an.instanceof Object

