### test: EventSource ###

should = require 'should'
EventSource = require '../../mixin/event-source'
isConfigurable = require '../../property/is-configurable'
isEnumerable = require '../../property/is-enumerable'
isWritable = require '../../property/is-writable'
getter = require '../../property/getter'
setter = require '../../property/setter'

describe 'EventSource', ->
  it 'should be a class', ->
    EventSource.should.be.a.Function
    EventSource::constructor.should.be.equal EventSource

  describe '#constructor()', ->
    it 'should return an instance of EventSource', -> (new EventSource).should.be.an.instanceof EventSource

  describe 'instance', ->

    it 'should have "___is_event_source" property', -> (new EventSource).should.have.property '___is_event_source'

    describe '#___is_event_source', ->
      it 'should be boolean', -> (new EventSource).___is_event_source.should.be.a.Boolean
      it 'should be "true"', -> (new EventSource).___is_event_source.should.be.ok
      it 'should not be configurable', -> (isConfigurable (new EventSource), '___is_event_source').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new EventSource), '___is_event_source').should.be.equal no
      it 'should not be writable', -> (isWritable (new EventSource), '___is_event_source').should.be.equal no

