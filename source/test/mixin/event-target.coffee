### test: EventTarget ###

should = require 'should'
Base = require '../../mixin/base'
Event = require '../../mixin/event'
EventTarget = require '../../mixin/event-target'
isConfigurable = require '../../property/is-configurable'
isEnumerable = require '../../property/is-enumerable'
isWritable = require '../../property/is-writable'
getter = require '../../property/getter'
setter = require '../../property/setter'

describe 'EventTarget', ->
  it 'should be a class', ->
    EventTarget.should.be.a.Function
    EventTarget::constructor.should.be.equal EventTarget

  it 'should be a subclass of Base', -> (Object.create EventTarget::).should.be.an.instanceof Base

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
      it 'should be an array', -> (new EventTarget).___listeners.should.be.an.Object
      it 'should not be configurable', -> (isConfigurable (new EventTarget), '___listeners').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new EventTarget), '___listeners').should.be.equal no
      it 'should not be writable', -> (isWritable (new EventTarget), '___listeners').should.be.equal no

    describe '#addEventListener(type, listener, phase = Event.BUBBLING_PHASE)', ->
      it 'should return own "EventTarget" instance', -> (test = new EventTarget).addEventListener().should.be.equal test

      it 'should add "listener" to default phase (Event.BUBBLING_PHASE)', ->
        (new EventTarget).addEventListener('test', (listener = ->)).___listeners[Event.BUBBLING_PHASE].test[0].should.be.equal listener

      it 'should not add duplicates to default phase (Event.BUBBLING_PHASE)', ->
        (new EventTarget)
          .addEventListener 'test', listener = (->)
          .addEventListener 'test', listener
          .___listeners[Event.BUBBLING_PHASE].test.length.should.be.equal 1

      it 'should add "listener" to Event.BUBBLING_PHASE', ->
        (new EventTarget)
          .addEventListener 'test', (listener = ->), Event.BUBBLING_PHASE
          .___listeners[Event.BUBBLING_PHASE].test[0].should.be.equal listener

      it 'should not add duplicates to Event.BUBBLING_PHASE', ->
        (new EventTarget)
          .addEventListener 'test', (listener = ->), Event.BUBBLING_PHASE
          .addEventListener 'test', listener, Event.BUBBLING_PHASE
          .___listeners[Event.BUBBLING_PHASE].test.length.should.be.equal 1

      it 'should add "listener" to Event.CAPTURING_PHASE', ->
        (new EventTarget)
          .addEventListener 'test', (listener = ->), Event.CAPTURING_PHASE
          .___listeners[Event.CAPTURING_PHASE].test[0].should.be.equal listener

      it 'should not add duplicates to Event.CAPTURING_PHASE', ->
        (new EventTarget)
          .addEventListener 'test', (listener = ->), Event.CAPTURING_PHASE
          .addEventListener 'test', listener, Event.CAPTURING_PHASE
          .___listeners[Event.CAPTURING_PHASE].test.length.should.be.equal 1

      it 'should do nothing when "phase" is not Event.BUBBLING_PHASE or Event.CAPTURING_PHASE', ->
        (new EventTarget).addEventListener('test', (->), 'invalid phase').___listeners.should.be.empty

      it 'should do nothing when "type" is not a "String"', ->
        (new EventTarget).addEventListener(0, ->).___listeners.should.be.empty

      it 'should do nothing when "type" is empty "String"', ->
        (new EventTarget).addEventListener('', ->).___listeners.should.be.empty

      it 'should do nothing when "type" is "null"', ->
        (new EventTarget).addEventListener(null, ->).___listeners.should.be.empty

      it 'should do nothing when "type" is "undefined"', ->
        (new EventTarget).addEventListener(undefined, ->).___listeners.should.be.empty

      it 'should do nothing when "listener" is not a "Function"', ->
        (new EventTarget).addEventListener('test', 'invalid listener').___listeners.should.be.empty

      it 'should do nothing when "listener" is "null"', ->
        (new EventTarget).addEventListener('test', null).___listeners.should.be.empty

      it 'should do nothing when "listener" is "undefined"', ->
        (new EventTarget).addEventListener('test', undefined).___listeners.should.be.empty

    describe '#removeEventListener(type, listener, phase = Event.BUBBLING_PHASE)', ->
      it 'should return own "EventTarget" instance', -> (test = new EventTarget).removeEventListener().should.be.equal test

      it 'should remove the "listener" from default phase (Event.BUBBLING_PHASE)', ->
        (new EventTarget)
          .addEventListener 'test', listener = (->)
          .removeEventListener 'test', listener
          .___listeners[Event.BUBBLING_PHASE].should.be.empty

      it 'should remove the "listener" from Event.BUBBLING_PHASE', ->
        (new EventTarget)
          .addEventListener 'test', listener = (->), Event.BUBBLING_PHASE
          .removeEventListener 'test', listener, Event.BUBBLING_PHASE
          .___listeners[Event.BUBBLING_PHASE].should.be.empty

      it 'should remove the "listener" from Event.CAPTURING_PHASE', ->
        (new EventTarget)
          .addEventListener 'test', listener = (->), Event.CAPTURING_PHASE
          .removeEventListener 'test', listener, Event.CAPTURING_PHASE
          .___listeners[Event.CAPTURING_PHASE].should.be.empty

      it 'should do nothing when "phase" is not Event.BUBBLING_PHASE or Event.CAPTURING_PHASE', ->
        (new EventTarget)
          .addEventListener 'test', listener = (->), Event.BUBBLING_PHASE
          .removeEventListener 'test', listener, 'invalid phase'
          .___listeners[Event.BUBBLING_PHASE].should.not.be.empty

      it 'should do nothing for unknown listeners', ->
        (new EventTarget)
          .addEventListener 'test', listener = (->)
          .removeEventListener 'test', (->)
          .___listeners[Event.BUBBLING_PHASE].should.not.be.empty

      it 'should do nothing when "type" is not a "String"', ->
        (new EventTarget)
          .addEventListener 'test', listener = (->)
          .removeEventListener 0, listener
          .___listeners[Event.BUBBLING_PHASE].should.not.be.empty

      it 'should do nothing when "type" is empty "String"', ->
        (new EventTarget)
          .addEventListener 'test', listener = (->)
          .removeEventListener '', listener
          .___listeners[Event.BUBBLING_PHASE].should.not.be.empty

      it 'should do nothing when "type" is "null"', ->
        (new EventTarget)
          .addEventListener 'test', listener = (->)
          .removeEventListener null, (->)
          .___listeners[Event.BUBBLING_PHASE].should.not.be.empty

      it 'should do nothing when "type" is "undefined"', ->
        (new EventTarget)
          .addEventListener 'test', listener = (->)
          .removeEventListener undefined, (->)
          .___listeners[Event.BUBBLING_PHASE].should.not.be.empty

      it 'should do nothing when "listener" is not a "Function"', ->
        (new EventTarget)
          .addEventListener 'test', listener = (->)
          .removeEventListener 'test', 0
          .___listeners[Event.BUBBLING_PHASE].should.not.be.empty

      it 'should do nothing when "listener" is "null"', ->
        (new EventTarget)
          .addEventListener 'test', listener = (->)
          .removeEventListener 'test', null
          .___listeners[Event.BUBBLING_PHASE].should.not.be.empty

      it 'should do nothing when "listener" is "undefined"', ->
        (new EventTarget)
          .addEventListener 'test', listener = (->)
          .removeEventListener 'test', undefined
          .___listeners[Event.BUBBLING_PHASE].should.not.be.empty

    describe '#dispatchEvent(event)', ->
      it 'should return own instance', -> (test = new EventTarget).dispatchEvent().should.be.equal test

      it 'should do nothing when "event.phase" is not Event.BUBBLING_PHASE or Event.CAPTURING_PHASE', ->
        pass = yes
        (new EventTarget)
          .addEventListener 'test', (-> pass = no)
          .dispatchEvent ___is_event:yes, type:'text', phase:'invalid phase'
        pass.should.be.ok

      it 'should do nothing when "event.type" is not a String', ->
        pass = yes
        (new EventTarget)
          .addEventListener 'test', (-> pass = no)
          .dispatchEvent ___is_event:yes, type:{}, phase:Event.BUBBLING_PHASE
        pass.should.be.ok

      it 'should do nothing when "event.type" is empty String', ->
        pass = yes
        (new EventTarget)
          .addEventListener 'test', (-> pass = no)
          .dispatchEvent ___is_event:yes, type:'', phase:Event.BUBBLING_PHASE
        pass.should.be.ok

      it 'should do nothing when "event.type" is "null"', ->
        pass = yes
        (new EventTarget)
          .addEventListener 'test', (-> pass = no)
          .dispatchEvent ___is_event:yes, type:null, phase:Event.BUBBLING_PHASE
        pass.should.be.ok

      it 'should do nothing when "event.type" is "undefined"', ->
        pass = yes
        (new EventTarget)
          .addEventListener 'test', (-> pass = no)
          .dispatchEvent ___is_event:yes, type:undefined, phase:Event.BUBBLING_PHASE
        pass.should.be.ok

      it 'should not call listeners when "event.stopped" is "true"', ->
        pass = yes
        (new EventTarget)
          .addEventListener 'test', (-> pass = no)
          .dispatchEvent ___is_event:yes, type:'test', stopped:yes, phase:Event.BUBBLING_PHASE
        pass.should.be.ok

      it 'should not call listeners when "event.stoppedImmediate" is "true"', ->
        pass = yes
        (new EventTarget)
          .addEventListener 'test', (-> pass = no)
          .dispatchEvent ___is_event:yes, type:'test', stoppedImmediate:yes, phase:Event.BUBBLING_PHASE
        pass.should.be.ok

      it 'should stop calling listeners when "event.stopped" is "true"', ->
        pass = yes
        (new EventTarget)
          .addEventListener 'test', (e) -> e.stopped = yes
          .addEventListener 'test', -> pass = no
          .dispatchEvent ___is_event:yes, type:'test', phase:Event.BUBBLING_PHASE
        pass.should.be.ok

      it 'should stop calling listeners when "event.stoppedImmediate" is "true"', ->
        pass = yes
        (new EventTarget)
          .addEventListener 'test', (e) -> e.stoppedImmediate = yes
          .addEventListener 'test', -> pass = no
          .dispatchEvent ___is_event:yes, type:'test', phase:Event.BUBBLING_PHASE
        pass.should.be.ok

      it 'should call all capture phase listeners if event.target is not this EventTarget instance', ->
        count = 0
        (new EventTarget)
          .addEventListener 'test', -> throw new Error 'Should not call BUBBLING_PHASE listeners'
          .addEventListener 'test', (-> count++), Event.CAPTURING_PHASE
          .addEventListener 'test', (-> count++), Event.CAPTURING_PHASE
          .dispatchEvent ___is_event:yes, type:'test'
        count.should.be.equal 2

      ###it 'should call all listeners for the "event.type" and "event.phase"', ->
        count = 0
        (new EventTarget)
          .addEventListener 'test', -> count++
          .addEventListener 'test', -> count++
          .dispatchEvent ___is_event:yes, type:'test', phase:Event.BUBBLING_PHASE
        count.should.be.equal 2###

      it 'should pass the "event" to the listeners', ->
        event = ___is_event:yes, type:'test', phase:Event.BUBBLING_PHASE
        count = 0
        (new EventTarget)
          .addEventListener 'test', (e) -> count++ and e.should.be.equal event
          .addEventListener 'test', (e) -> count++ and e.should.be.equal event
          .dispatchEvent event
        count.should.be.equal 2

      it 'should pass own instance as "this" argument to the listeners', ->
        event = ___is_event:yes, type:'test', phase:Event.BUBBLING_PHASE
        count = 0
        (eventTarget = new EventTarget)
          .addEventListener 'test', (e) -> count++ and this.should.be.equal eventTarget
          .addEventListener 'test', (e) -> count++ and this.should.be.equal eventTarget
          .dispatchEvent event
        count.should.be.equal 2
