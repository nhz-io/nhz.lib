### test: NHZ Library ###

#require './stage'
should = require 'should'
nhz = require '../index'

describe 'nhz', ->
  it 'should have "array" namespace', -> nhz.array.should.be.an.instanceof Object
  it 'should have "object" namespace', -> nhz.object.should.be.an.instanceof Object
  it 'should have "error" namespace', -> nhz.error.should.be.an.instanceof Object
  it 'should have "browser" namespace', -> nhz.browser.should.be.an.instanceof Object
  it 'should have "geometry" namespace', -> nhz.geometry.should.be.an.instanceof Object
  it 'should have "async" namespace', -> nhz.async.should.be.an.instanceof Object
  it 'should have "coffee" namespace', -> nhz.coffee.should.be.an.instanceof Object
  it 'should have "mixin" namespace', -> nhz.mixin.should.be.an.instanceof Object
  it 'should have "property" namespace', -> nhz.property.should.be.an.instanceof Object
  it 'should have "mapper" namespace', -> nhz.mapper.should.be.an.instanceof Object

