### test: EventTarget ###

should = require 'should'
Event = require '../../mixin/event'
EventTarget = require '../../mixin/event-target'

should = require 'should'

describe 'EventTarget', ->
  it 'should be a class', ->
    EventTarget.should.be.a.Function
    EventTarget::constructor.should.be.equal EventTarget

  describe '#constructor()', ->
    it 'should return an instance of EventTarget', -> (new EventTarget).should.be.an.instanceof EventTarget

  describe 'instance', ->

    it 'should have "___is_event_target" property', -> (new EventTarget).should.have.property '___is_event_target'

    it 'should have "___listeners" property', -> (new EventTarget).should.have.property '___listeners'

    it 'should have "addEventListener()" method', -> (new EventTarget).addEventListener.should.be.a.Function

    it 'should have "removeEventListener()" method', -> (new EventTarget).removeEventListener.should.be.a.Function

    it 'should have "dispatchEvent()" method', -> (new EventTarget).dispatchEvent.should.be.a.Function

    describe '#___is_event_target', ->
      it 'should be boolean', -> (new EventTarget).___is_event_target.should.be.a.Boolean
      it 'should be "true"', -> (new EventTarget).___is_event_target.should.be.ok
      it 'should not be configurable', -> (isConfigurable (new EventTarget), '___is_event_target').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new EventTarget), '___is_event_target').should.be.equal no
      it 'should not be writable', -> (isWritable (new EventTarget), '___is_event_target').should.be.equal no

    describe '#___listeners', ->
      it 'should be an array', -> (new EventTarget).___listeners.should.be.an.Array
      it 'should not be configurable', -> (isConfigurable (new EventTarget), '___listeners').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new EventTarget), '___listeners').should.be.equal no
      it 'should not be writable', -> (isWritable (new EventTarget), '___listeners').should.be.equal no

    describe '#addEventListener(type, listener, phase = Event.BUBBLING_PHASE)', ->
      it 'should return itself', -> (test = new Parent).removeChild().should.be.equal test

      it 'should add "listener" to default phase (Event.BUBBLING_PHASE)', ->

      it 'should not add duplicates to default phase (Event.BUBBLING_PHASE)', ->

      it 'should add "listener" to Event.BUBBLING_PHASE', ->

      it 'should not add duplicates to Event.BUBBLING_PHASE', ->

      it 'should add "listener" to Event.CAPTURING_PHASE', ->

      it 'should not add duplicates to Event.CAPTURING_PHASE', ->

      it 'should do nothing when "phase" is not Event.BUBBLING_PHASE or Event.CAPTURING_PHASE', ->

      it 'should do nothing when "type" is not a "String"', ->

      it 'should do nothing when "type" is empty "String"', ->

      it 'should do nothing when "type" is "null"', ->

      it 'should do nothing when "type" is "undefined"', ->

      it 'should do nothing when "listener" is not a "Function"', ->

      it 'should do nothing when "listener" is "null"', ->

      it 'should do nothing when "listener" is "undefined"', ->

    describe '#removeEventListener(type, listener, phase = Event.BUBBLING_PHASE)', ->
      it 'should return itself', -> (test = new Parent).removeChild().should.be.equal test

      it 'should remove the "listener" from default phase (Event.BUBBLING_PHASE)', ->

      it 'should remove the "listener" from Event.BUBBLING_PHASE', ->

      it 'should remove the "listener" from Event.CAPTURING_PHASE', ->

      it 'should do nothing when "phase" is not Event.BUBBLING_PHASE or Event.CAPTURING_PHASE', ->

      it 'should do nothing for unknown listeners', ->

      it 'should do nothing when "type" is not a "String"', ->

      it 'should do nothing when "type" is empty "String"', ->

      it 'should do nothing when "type" is "null"', ->

      it 'should do nothing when "type" is "undefined"', ->

      it 'should do nothing when "listener" is not a "Function"', ->

      it 'should do nothing when "listener" is "null"', ->

      it 'should do nothing when "listener" is "undefined"', ->

    describe '#dispatchEvent(event)', ->
      it 'should return itself', -> (test = new Parent).removeChild().should.be.equal test

      it 'should do nothing when "event.phase" is not Event.BUBBLING_PHASE or Event.CAPTURING_PHASE', ->

      it 'should do nothing when "event.type" is not a String', ->

      it 'should do nothing when "event.type" is empty String', ->

      it 'should do nothing when "event.type" is "null"', ->

      it 'should do nothing when "event.type" is "undefined"', ->

      it 'should do nothing when there are no listeners for "event.type" and "event.phase"', ->

      it 'should not call listeners when "event.stopped" is "true"', ->

      it 'should not call listeners when "event.stoppedImmediate" is "true"', ->

      it 'should stop calling listeners when "event.stopped" is "true"', ->

      it 'should stop calling listeners when "event.stoppedImmediate" is "true"', ->

      it 'should call all listeners for the "event.type" and "event.phase"', ->

