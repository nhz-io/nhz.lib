### test: web-api.Event(type) ###

should = require 'should'
Event = require '../../web-api/event'

describe 'Event(type)', ->
  it 'should be a constructor', ->
    Event.should.be.a.Function
    Event::constructor.should.be.equal Event

  it 'should have "NONE" property', -> Event.should.have.property "NONE"
  it 'should have "CAPTURING_PHASE" property', -> Event.should.have.property "CAPTURING_PHASE"
  it 'should have "AT_TARGET" property', -> Event.should.have.property "AT_TARGET"
  it 'should have "BUBBLING_PHASE" property', -> Event.should.have.property "BUBBLING_PHASE"

  it 'should throw "Not enough arguments to Event" when called without type', ->
    (-> new Event).should.throw "Not enough arguments to Event"

  it 'should return an instance of Event when called with type', ->
    (new Event 'test').should.be.an.instanceof Event

  describe 'instance', ->
    it 'should have "type" property', -> (new Event 'test').should.have.property "type"
    it 'should have "bubbles" property', -> (new Event 'test').should.have.property "bubbles"
    it 'should have "cancelable" property', -> (new Event 'test').should.have.property "cancelable"
    it 'should have "timeStamp" property', -> (new Event 'test').should.have.property "timeStamp"
    it 'should have "currentTarget" property', -> (new Event 'test').should.have.property "currentTarget"
    it 'should have "eventPhase" property', -> (new Event 'test').should.have.property "eventPhase"
    it 'should have "target" property', -> (new Event 'test').should.have.property "target"
    it 'should have "isTrusted" property', -> (new Event 'test').should.have.property "isTrusted"
    it 'should have "defaultPrevented" property', -> (new Event 'test').should.have.property "defaultPrevented"
    it 'should have "___stop" property', -> (new Event 'test').should.have.property "___stop"
    it 'should have "___stop_immediate" property', -> (new Event 'test').should.have.property "___stop_immediate"

    it 'should have "preventDefault()" method', -> (new Event 'test').preventDefault.should.be.a.Function
    it 'should have "stopImmediatePropagation()" method', -> (new Event 'test').stopImmediatePropagation.should.be.a.Function
    it 'should have "stopPropagation()" method', -> (new Event 'test').stopPropagation.should.be.a.Function


    describe '#preventDefault()', ->
      it 'should return the Event instance', -> (test = new Event 'test').preventDefault().should.be.equal test
      it 'should set "defaultPrevented" to true if "cancelable" is true', ->
        (new Event 'test', cancelable:yes).preventDefault().defaultPrevented.should.be.ok
      it 'should not set "defaultPrevented" to true if "cancelable" is not true', ->
        (new Event 'test').preventDefault().defaultPrevented.should.not.be.ok

    describe '#stopPropagation()', ->
      it 'should return the Event instance', -> (test = new Event 'test').stopPropagation().should.be.equal test
      it 'should set "___stop" to true"', -> (test = new Event 'test').stopPropagation().___stop.should.be.ok

    describe '#stopImmediatPropagation()', ->
      it 'should return the Event instance', -> (test = new Event 'test').stopImmediatePropagation().should.be.equal test
      it 'should set "___stop_immediate" to true"', -> (test = new Event 'test').stopImmediatePropagation().___stop_immediate.should.be.ok
