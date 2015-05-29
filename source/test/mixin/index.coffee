### test: NHZ Library: mixin ###

should = require 'should'
mixin = require '../../mixin/index'

describe 'mixin', ->
  it 'should have "Parent" function', -> mixin.Parent.should.be.a.Function
  it 'should have "Child" function', -> mixin.Child.should.be.a.Function
  it 'should have "Event" function', -> mixin.Event.should.be.a.Function
  it 'should have "EventSource" function', -> mixin.EventSource.should.be.a.Function
  it 'should have "EventTarget" function', -> mixin.EventTarget.should.be.a.Function
