### test: NHZ Library: web-api ###

should = require 'should'
webApi = require '../../web-api/index'

describe 'Web API', ->
  it 'should have "Event" function', -> webApi.Event.should.be.an.instanceof Function
  it 'should have "EventTarget" function', -> webApi.EventTarget.should.be.an.instanceof Function
