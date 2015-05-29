### test: EventSource ###

should = require 'should'
Base = require '../../mixin/base'
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

  it 'should be a subclass of Base', -> (Object.create EventSource::).should.be.an.instanceof Base

  describe '#constructor()', ->
    it 'should return an instance of EventSource', -> (new EventSource).should.be.an.instanceof EventSource

  describe 'instance', ->

    it 'should have "___is_event_source" property', -> (new EventSource).should.have.property '___is_event_source'

    it 'should have "emitEvent()" method', -> (new EventSource).emitEvent.should.be.a.Function

    describe '#___is_event_source', ->
      it 'should be boolean', -> (new EventSource).___is_event_source.should.be.a.Boolean
      it 'should be "true"', -> (new EventSource).___is_event_source.should.be.ok
      it 'should not be configurable', -> (isConfigurable (new EventSource), '___is_event_source').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new EventSource), '___is_event_source').should.be.equal no
      it 'should not be writable', -> (isWritable (new EventSource), '___is_event_source').should.be.equal no


    describe '#emitEvent(event, target)', ->
      it 'should return own "EventSource" instance', -> (test = new EventSource).emitEvent().should.be.equal test

      it 'should use target.dispatchEvent()', ->
        pass = no
        (new EventSource).emitEvent {___is_event:yes}, ___is_event_target:yes, dispatchEvent: -> pass = yes
        pass.should.be.ok

      it 'should emit event to target', ->
        result = null
        (new EventSource).emitEvent (event = ___is_event:yes), ___is_event_target:yes, dispatchEvent: (e) -> result = e
        result.should.be.equal event

      it 'should not emit event if target is not "EventTarget" (__is_event_target is not "true")', ->
        pass = yes
        (new EventSource).emitEvent {___is_event:yes}, dispatchEvent: -> pass = no
        pass.should.be.ok

      it 'should not emit event if event is not "Event", (___is_event is not "true")', ->
        pass = yes
        (new EventSource).emitEvent {}, ___is_event_target:yes, dispatchEvent: -> pass = no
        pass.should.be.ok

      it 'should not emit event if there is no target', -> (new EventSource).emitEvent {___is_event:yes}

      it 'should call the event callback when done', ->
        pass = no
        (new EventSource).emitEvent (___is_event:yes, callback: -> pass = yes), ___is_event_target:yes
        pass.should.be.ok

      it 'should not call the event callback if event was canceled', ->
        pass = yes
        (new EventSource)
          .emitEvent (___is_event:yes, cancel: (-> @canceled = yes), callback: -> pass = no),
            ___is_event_target:yes, dispatchEvent: (e) -> e.cancel()
        pass.should.be.ok
