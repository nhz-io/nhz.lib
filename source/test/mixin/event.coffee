### test: mixin.Event ###

should = require 'should'
Base = require '../../mixin/base'
Event = require '../../mixin/event'
isConfigurable = require '../../property/is-configurable'
isEnumerable = require '../../property/is-enumerable'
isWritable = require '../../property/is-writable'
getter = require '../../property/getter'
setter = require '../../property/setter'

describe 'Event', ->
  it 'should be a class', ->
    Event.should.be.a.Function
    Event::constructor.should.be.equal Event

  it 'should be a subclass of Base', -> (Object.create Event::).should.be.an.instanceof Base

  describe '#constructor()', ->
    it 'should return an instance of Event', -> (new Event).should.be.an.instanceof Event

  describe 'instance', ->

    it 'should have "___is_event" property', -> (new Event).should.have.property '___is_event'

    it 'should have "___type" property', -> (new Event).should.have.property '___type'

    it 'should have "___timestamp" property', -> (new Event).should.have.property '___timestamp'

    it 'should have "___source" property', -> (new Event).should.have.property '___source'

    it 'should have "___target" property', -> (new Event).should.have.property '___target'

    it 'should have "___phase" property', -> (new Event).should.have.property '___phase'

    it 'should have "___canceled" property', -> (new Event).should.have.property '___canceled'

    it 'should have "___stopped" property', -> (new Event).should.have.property '___stopped'

    it 'should have "___stopped_immediate" property', -> (new Event).should.have.property '___stopped_immediate'

    it 'should have "type" property', -> (new Event).should.have.property 'type'

    it 'should have "timestamp" property', -> (new Event).should.have.property 'timestamp'

    it 'should have "source" property', -> (new Event).should.have.property 'source'

    it 'should have "target" property', -> (new Event).should.have.property 'target'

    it 'should have "phase" property', -> (new Event).should.have.property 'phase'

    it 'should have "canceled" property', -> (new Event).should.have.property 'canceled'

    it 'should have "stopped" property', -> (new Event).should.have.property 'stopped'

    it 'should have "stoppedImmediate" property', -> (new Event).should.have.property 'stoppedImmediate'

    it 'should have "cancel()" method', -> (new Event).cancel.should.be.a.Function

    it 'should have "stop()" method', -> (new Event).stop.should.be.a.Function

    it 'should have "stopImmediate()" method', -> (new Event).stopImmediate.should.be.a.Function

    describe '#___is_event', ->
      it 'should be "Boolean"', -> (new Event).___is_event.should.be.a.Boolean
      it 'should be "true"', -> (new Event).___is_event.should.be.equal yes
      it 'should not be configurable', -> (isConfigurable (new Event), '___is_event').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Event), '___is_event').should.be.equal no
      it 'should not be writable', -> (isWritable (new Event), '___is_event').should.be.equal no

    describe '#___type', ->
      it 'should be "String"', -> (new Event).___type.should.be.a.String
      it 'should not be empty"', -> (new Event).___type.should.not.be.equal ''
      it 'should be default type (event)"', -> (new Event).___type.should.be.equal 'event'
      it 'should be provide type (with new Event(type))"', -> (new Event 'test').___type.should.be.equal 'test'
      it 'should not be configurable', -> (isConfigurable (new Event), '___type').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Event), '___type').should.be.equal no
      it 'should be writable', -> (isWritable (new Event), '___type').should.be.equal yes

    describe '#___timestamp', ->
      it 'should be "Number"', -> (new Event).___timestamp.should.be.a.Number
      it 'should not be configurable', -> (isConfigurable (new Event), '___timestamp').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Event), '___timestamp').should.be.equal no
      it 'should be writable', -> (isWritable (new Event), '___timestamp').should.be.equal yes
      it 'should be greater than 0', -> should((new Event).___timestamp > 0).be.ok

    describe '#___source', ->
      it 'should not be configurable', -> (isConfigurable (new Event), '___source').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Event), '___source').should.be.equal no
      it 'should be writable', -> (isWritable (new Event), '___source').should.be.equal yes

    describe '#___target', ->
      it 'should not be configurable', -> (isConfigurable (new Event), '___target').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Event), '___target').should.be.equal no
      it 'should be writable', -> (isWritable (new Event), '___target').should.be.equal yes

    describe '#___phase', ->
      it 'should not be configurable', -> (isConfigurable (new Event), '___phase').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Event), '___phase').should.be.equal no
      it 'should be writable', -> (isWritable (new Event), '___phase').should.be.equal yes

    describe '#___canceled', ->
      it 'should be an "Boolean"', -> (new Event).___canceled.should.be.a.Boolean
      it 'should not be configurable', -> (isConfigurable (new Event), '___canceled').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Event), '___canceled').should.be.equal no
      it 'should be writable', -> (isWritable (new Event), '___canceled').should.be.equal yes

    describe '#___stopped', ->
      it 'should be an "Boolean"', -> (new Event).___stopped.should.be.a.Boolean
      it 'should not be configurable', -> (isConfigurable (new Event), '___stopped').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Event), '___stopped').should.be.equal no
      it 'should be writable', -> (isWritable (new Event), '___stopped').should.be.equal yes

    describe '#___stopped_immediate', ->
      it 'should be an "Boolean"', -> (new Event).___stopped_immediate.should.be.a.Boolean
      it 'should not be configurable', -> (isConfigurable (new Event), '___stopped_immediate').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Event), '___stopped_immediate').should.be.equal no
      it 'should be writable', -> (isWritable (new Event), '___stopped_immediate').should.be.equal yes

    describe '#type', ->
      it 'should be configurable', -> (isConfigurable (new Event), 'type').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Event), 'type').should.be.equal yes
      it 'should not be writable', -> (isWritable (new Event), 'type').should.be.equal no
      it 'should have a getter', -> (getter (new Event), 'type').should.be.a.Function
      it 'should not have a setter', -> should(setter (new Event), 'type').not.be.ok

      describe 'getter', -> it 'should return the value of "___type"', ->
        (event = new Event).___type = 'test'
        event.type.should.be.equal event.___type

    describe '#timestamp', ->
      it 'should be configurable', -> (isConfigurable (new Event), 'timestamp').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Event), 'timestamp').should.be.equal yes
      it 'should not be writable', -> (isWritable (new Event), 'timestamp').should.be.equal no
      it 'should have a getter', -> (getter (new Event), 'timestamp').should.be.a.Function
      it 'should not have a setter', -> should(setter (new Event), 'timestamp').not.be.ok

      describe 'getter', -> it 'should return the value of "___timestamp"', ->
        event = new Event
        event.timestamp.should.be.equal event.___timestamp

    describe '#source', ->
      it 'should be configurable', -> (isConfigurable (new Event), 'source').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Event), 'source').should.be.equal yes
      it 'should not be writable', -> (isWritable (new Event), 'source').should.be.equal no
      it 'should have a getter', -> (getter (new Event), 'source').should.be.a.Function
      it 'should not have a setter', -> should(setter (new Event), 'source').not.be.ok

      describe 'getter', -> it 'should return the value of "___source"', ->
        (event = new Event).___source = 'test'
        event.source.should.be.equal event.___source

    describe '#target', ->
      it 'should be configurable', -> (isConfigurable (new Event), 'target').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Event), 'target').should.be.equal yes
      it 'should not be writable', -> (isWritable (new Event), 'target').should.be.equal no
      it 'should have a getter', -> (getter (new Event), 'target').should.be.a.Function
      it 'should not have a setter', -> should(setter (new Event), 'target').not.be.ok

      describe 'getter', -> it 'should return the value of "___target"', ->
        (event = new Event).___target = 'test'
        event.target.should.be.equal event.___target

    describe '#phase', ->
      it 'should be configurable', -> (isConfigurable (new Event), 'phase').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Event), 'phase').should.be.equal yes
      it 'should not be writable', -> (isWritable (new Event), 'phase').should.be.equal no
      it 'should have a getter', -> (getter (new Event), 'phase').should.be.a.Function
      it 'should not have a setter', -> should(setter (new Event), 'phase').not.be.ok

      describe 'getter', -> it 'should return the value of "___phase"', ->
        (event = new Event).___phase = 'test'
        event.phase.should.be.equal event.___phase

    describe '#canceled', ->
      it 'should be configurable', -> (isConfigurable (new Event), 'canceled').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Event), 'canceled').should.be.equal yes
      it 'should not be writable', -> (isWritable (new Event), 'canceled').should.be.equal no
      it 'should have a getter', -> (getter (new Event), 'canceled').should.be.a.Function
      it 'should not have a setter', -> should(setter (new Event), 'canceled').not.be.ok

      describe 'getter', -> it 'should return the value of "___canceled"', ->
        (event = new Event).___canceled = 'test'
        event.canceled.should.be.equal event.___canceled

    describe '#stopped', ->
      it 'should be configurable', -> (isConfigurable (new Event), 'stopped').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Event), 'stopped').should.be.equal yes
      it 'should not be writable', -> (isWritable (new Event), 'stopped').should.be.equal no
      it 'should have a getter', -> (getter (new Event), 'stopped').should.be.a.Function
      it 'should not have a setter', -> should(setter (new Event), 'stopped').not.be.ok

      describe 'getter', -> it 'should return the value of "___stopped"', ->
        (event = new Event).___stopped = 'test'
        event.stopped.should.be.equal event.___stopped

    describe '#stoppedImmediate', ->
      it 'should be configurable', -> (isConfigurable (new Event), 'stoppedImmediate').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Event), 'stoppedImmediate').should.be.equal yes
      it 'should not be writable', -> (isWritable (new Event), 'stoppedImmediate').should.be.equal no
      it 'should have a getter', -> (getter (new Event), 'stoppedImmediate').should.be.a.Function
      it 'should not have a setter', -> should(setter (new Event), 'stoppedImmediate').not.be.ok

      describe 'getter', -> it 'should return the value of "___stopped_immediate"', ->
        (event = new Event).___stopped_immediate = 'test'
        event.stoppedImmediate.should.be.equal event.___stopped_immediate

    describe '#cancel()', ->
      it 'should return Event instance (itself)', -> (test = new Event 'test').cancel().should.be.equal test
      it 'should set "___canceled" to "true"', -> (new Event).cancel().___canceled.should.be.equal yes

    describe '#stop()', ->
      it 'should return Event instance (itself)', -> (test = new Event 'test').stop().should.be.equal test
      it 'should set "___stopped" to "true"', -> (new Event).stop().___stopped.should.be.equal yes

    describe '#stopImmediate()', ->
      it 'should return Event instance (itself)', -> (test = new Event 'test').stopImmediate().should.be.equal test
      it 'should set "___stopped_immediate" to "true"', -> (new Event).stopImmediate().___stopped_immediate.should.be.equal yes
