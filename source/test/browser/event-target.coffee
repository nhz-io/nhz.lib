### test: browser.EventTarget(target...) ###

require '../stage'
should = require 'should'
EventTarget = require '../../browser/event-target'
describe 'EventTarget(target...)', ->
  it 'should be a function', -> EventTarget.should.be.a.Function

  it 'should return an instance of EventTarget', -> (new EventTarget).should.be.an.instanceof EventTarget

  it 'should return an instance of native EventTarget', -> (new EventTarget).should.be.an.instanceof window.EventTarget

  describe 'instance', ->
    it 'should have __event_target property', -> (new EventTarget).__event_target.should.be.ok
    describe '__event_target property', ->
      it 'should be an instance of native EventTarget', -> (new EventTarget).__event_target.should.be.an.instanceof window.EventTarget

      it 'should be equal to the target provided to constructor if the target was an instance of native EventTarget', ->
        test = document.createElement 'div'
        (new EventTarget test).__event_target.should.be.equal test

      it 'should be equal to the provided target\'s __event_target property if the target was an instance of EventTarget', ->
        test = new EventTarget
        eventTarget = new EventTarget test
        eventTarget.__event_target.should.be.an.instanceof window.EventTarget
        eventTarget.__event_target.should.be.equal test.__event_target

      it 'should be an instance of HTMLElement created from the name provided in the target if target is a string', ->
        eventTarget = new EventTarget 'test'
        eventTarget.__event_target.should.be.an.instanceof window.EventTarget
        eventTarget.__event_target.nodeName.should.be.equal 'test'

    it 'should have __event_listeners property', -> (new EventTarget).__event_listeners.should.be.ok

    it 'should have __event_listener_wrappers property', -> (new EventTarget).__event_listener_wrappers.should.be.ok

  describe '#addEventListener(type, listener, useCapture, wantsUntrusted)', ->
    it 'should add an event listener', ->
      test = (->)
      eventTarget = new EventTarget
      (-> eventTarget.addEventListener 'test', test).should.throw 'UNIMPLEMENTED'
      eventTarget.__event_listeners.test.length.should.be.equal 1
      eventTarget.__event_listeners.test[0].should.be.equal test

    it 'should add a wrapper for the listener', ->
      eventTarget = new EventTarget
      test = -> throw new Error '"this" is not an eventTarget' unless this is eventTarget
      (-> eventTarget.addEventListener 'test', test).should.throw 'UNIMPLEMENTED'
      eventTarget.__event_listener_wrappers.test.length.should.be.equal 1
      eventTarget.__event_listener_wrappers.test[0].should.be.a.Function
      (-> eventTarget.__event_listener_wrappers.test[0]()).should.not.throw()

    it 'should not add duplicates', ->
      test = (->)
      eventTarget = new EventTarget
      (-> eventTarget.addEventListener 'test', test).should.throw 'UNIMPLEMENTED'
      eventTarget.__event_listeners.test.should.be.ok
      eventTarget.__event_listener_wrappers.test.should.be.ok
      eventTarget.__event_listeners.test.length.should.be.equal 1
      eventTarget.__event_listener_wrappers.test.length.should.be.equal 1
      (-> eventTarget.addEventListener 'test', test).should.throw 'UNIMPLEMENTED'
      eventTarget.__event_listeners.test.length.should.be.equal 1
      eventTarget.__event_listener_wrappers.test.length.should.be.equal 1
      eventTarget.__event_listeners.test[0].should.be.equal test
      eventTarget.__event_listener_wrappers.test[0].should.be.a.Function
      eventTarget.__event_listener_wrappers.test[0].should.not.be.equal test

  describe '#removeEventListener(type, listener, useCapture, wantsUntrusted)', ->
    it 'should remove the listener', ->
      test = (->)
      eventTarget = new EventTarget
      (-> eventTarget.addEventListener 'test', test).should.throw 'UNIMPLEMENTED'
      eventTarget.__event_listeners.test.length.should.be.equal 1
      eventTarget.__event_listener_wrappers.test.length.should.be.equal 1
      (-> eventTarget.removeEventListener 'test', test).should.throw 'UNIMPLEMENTED'
      eventTarget.__event_listeners.test.length.should.be.equal 0
      eventTarget.__event_listener_wrappers.test.length.should.be.equal 0

  describe '#dispatchEvent(event)', ->
    eventTarget = new EventTarget
    (-> eventTarget.dispatchEvent()).should.throw 'UNIMPLEMENTED'
