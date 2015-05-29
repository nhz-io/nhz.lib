### test: web-api.EventTargetTarget() ###

should = require 'should'
Event = require '../../web-api/event'
EventTarget = require '../../web-api/event-target'

describe 'EventTarget()', ->
  it 'should be a constructor', ->
    EventTarget.should.be.a.Function
    EventTarget::constructor.should.be.equal EventTarget

  it 'should return an instance of EventTarget', ->
    (new EventTarget).should.be.an.instanceof EventTarget

  describe 'instance', ->
    it 'should have "___listeners" property', -> (new EventTarget).should.have.property "___listeners"
    it 'should have "___listeners_capture" property', -> (new EventTarget).should.have.property "___listeners_capture"

    it 'should have "addEventListener(type, listener, useCapture)" method', ->
      (new EventTarget).addEventListener.should.be.a.Function

    it 'should have "removeEventListener(type, listener, useCapture)" method', ->
      (new EventTarget).removeEventListener.should.be.a.Function

    it 'should have "dispatchEvent(event)" method', ->
      (new EventTarget).dispatchEvent.should.be.a.Function

    describe '#addEventListener(type, listener, useCapture)', ->
      it 'should return the EventTarget instance', ->
        (test = new EventTarget).addEventListener('test', ->).should.be.equal test

      it 'should add an event listener (default)', ->
        listener = ->
        (test = new EventTarget).addEventListener 'test', listener
        test.___listeners.should.have.property 'test'
        test.___listeners.test.length.should.be.equal 1
        test.___listeners.test[0].should.be.equal listener

      it 'should add a capture event listener', ->
        listener = ->
        (test = new EventTarget).addEventListener 'test', listener, true
        test.___listeners_capture.should.have.property 'test'
        test.___listeners_capture.test.length.should.be.equal 1
        test.___listeners_capture.test[0].should.be.equal listener

      it 'should not add duplicates', ->
        listener = ->
        (test = new EventTarget).addEventListener 'test', listener
        test.addEventListener 'test', listener
        test.___listeners.test.length.should.be.equal 1

        test.addEventListener 'test', listener, true
        test.___listeners_capture.should.have.property 'test'
        test.addEventListener 'test', listener, true
        test.___listeners_capture.test.length.should.be.equal 1

    describe '#removeEventListener(type, listener, useCapture)', ->
      it 'should return the EventTarget instance', ->
        (test = new EventTarget).removeEventListener('test', ->).should.be.equal test

      it 'should remove the listener', ->
        listener = ->
        (test = new EventTarget).addEventListener 'test', listener
        test.removeEventListener 'test', listener
        test.___listeners.should.not.have.property 'test'

      it 'should remove the capture listener', ->
        listener = ->
        (test = new EventTarget).addEventListener 'test', listener, true
        test.removeEventListener 'test', listener, true
        test.___listeners_capture.should.not.have.property 'test'

    describe '#dispatchEvent(event)', ->
      it 'should return true or false', ->
        (test = new EventTarget).dispatchEvent(new Event 'test').should.be.Boolean

      describe 'Event.NONE phase', ->
        it 'should not call any listeners', ->
          test = new EventTarget
          listener = -> throw new Error 'Should not be called'
          test.addEventListener 'test', listener
          test.addEventListener 'test', listener, true
          test.dispatchEvent type:test

      describe 'Event.CAPTURING_PHASE', ->
        it 'should call the capturing listeners', ->
          ok = no
          test = new EventTarget
          test.addEventListener 'test', (-> ok = yes), true
          test.dispatchEvent type:'test', eventPhase:Event.CAPTURING_PHASE
          ok.should.be.ok

        it 'should not call bubbling listeners', ->
          bubbling = no
          capturing = no
          test = new EventTarget
          test.addEventListener 'test', -> bubbling = yes
          test.addEventListener 'test', (-> capturing = yes), yes
          test.dispatchEvent type:'test', eventPhase:Event.CAPTURING_PHASE
          bubbling.should.not.be.ok
          capturing.should.be.ok

        it 'should pass the event to the listener', ->
          test = new EventTarget
          test.addEventListener 'test', ((e) -> e.test.should.be.ok), yes
          test.dispatchEvent type:'test', eventPhase:Event.CAPTURING_PHASE, test:yes

        it 'should pass the event target as "this" to the listener', ->
          test = new EventTarget
          test.addEventListener 'test', (-> this.should.be.equal test), yes

      describe 'Event.BUBBLING_PHASE', ->
        it 'should call the bubbling listeners', ->
          ok = no
          test = new EventTarget
          test.addEventListener 'test', -> ok = yes
          test.dispatchEvent type:'test', eventPhase:Event.BUBBLING_PHASE
          ok.should.be.ok

        it 'should not call capturing listeners', ->
          bubbling = no
          capturing = no
          test = new EventTarget
          test.addEventListener 'test', -> bubbling = yes
          test.addEventListener 'test', (-> capturing = yes), yes
          test.dispatchEvent type:'test', eventPhase:Event.BUBBLING_PHASE
          bubbling.should.be.ok
          capturing.should.not.be.ok

        it 'should pass the event to the listener', ->
          test = new EventTarget
          test.addEventListener 'test', (e) -> e.test.should.be.ok
          test.dispatchEvent type:'test', eventPhase:Event.BUBBLING_PHASE, test:yes

        it 'should pass the event target as "this" to the listener', ->
          test = new EventTarget
          test.addEventListener 'test', (-> this.should.be.equal test), yes
          test.dispatchEvent type:'test', eventPhase:Event.BUBBLING_PHASE, test:yes

      describe 'Event.AT_TARGET phase', ->
        it 'should call the bubbling listeners before the capturing listeners', ->
          log = []
          test = new EventTarget
          test.addEventListener 'test', -> log.push 'bubbling'
          test.addEventListener 'test', (-> log.push 'capturing'), yes
          test.dispatchEvent type:'test', eventPhase:Event.AT_TARGET
          log[0].should.be.equal 'bubbling'
          log[1].should.be.equal 'capturing'

        it 'should pass the event to the listeners', ->
          test = new EventTarget
          test.addEventListener 'test', (e) -> e.test.should.be.ok
          test.addEventListener 'test', ((e) -> e.test.should.be.ok), yes
          test.dispatchEvent type:'test', eventPhase:Event.AT_TARGET, test:yes

        it 'should pass the event target as "this" to the listeners', ->
          test = new EventTarget
          test.addEventListener 'test', -> this.should.be.equal test
          test.addEventListener 'test', (-> this.should.be.equal test), yes
          test.dispatchEvent type:'test', eventPhase:Event.AT_TARGET, test:yes


