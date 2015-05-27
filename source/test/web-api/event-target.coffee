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
    it 'should have "___listeners_bubble" property', -> (new EventTarget 'test').should.have.property "___listeners_bubble"
    it 'should have "___listeners_capture" property', -> (new EventTarget 'test').should.have.property "___listeners_capture"

    it 'should have "addEventListener(type, listener, useCapture, wantsUntrusted)" method', ->
      (new EventTarget 'test').addEventListener.should.be.a.Function

    it 'should have "removeEventListener(type, listener, useCapture)" method', ->
      (new EventTarget 'test').removeEventListener.should.be.a.Function

    it 'should have "dispatchEvent(event)" method', ->
      (new EventTarget 'test').dispatchEvent.should.be.a.Function

    describe '#addEventListener(ype, listener, useCapture, wantsUntrusted)', ->
      it 'should return the EventTarget instance', ->
        (test = new EventTarget 'test').addEventListener('test', ->).should.be.equal test

    describe '#removeEventListener(ype, listener, useCapture)', ->
      it 'should return the EventTarget instance', ->
        (test = new EventTarget 'test').removeEventListener('test', ->).should.be.equal test

    describe '#dispatchEvent()', ->
      it 'should return true or false', ->
        (test = new EventTarget 'test').dispatchEvent(new Event 'test').should.be.boolean
