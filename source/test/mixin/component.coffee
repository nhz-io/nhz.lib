### test: Component ###

should = require 'should'
Base = require '../../mixin/base'
Component = require '../../mixin/component'
isConfigurable = require '../../property/is-configurable'
isEnumerable = require '../../property/is-enumerable'
isWritable = require '../../property/is-writable'
getter = require '../../property/getter'
setter = require '../../property/setter'

describe 'Component', ->
  it 'should be a class', ->
    Component.should.be.a.Function
    Component::constructor.should.be.equal Component

  it 'should be a subclass of Base', -> (Object.create Component::).should.be.an.instanceof Base

  describe '#constructor()', ->
    it 'should return an instance of Component', -> (new Component).should.be.an.instanceof Component

  describe 'instance', ->
    it 'should have "___is_child" property', -> (new Component).should.have.property '___is_child'
    it 'should have "___is_parent" property', -> (new Component).should.have.property '___is_parent'
    it 'should have "___is_event_source" property', -> (new Component).should.have.property '___is_event_source'
    it 'should have "___is_event_target" property', -> (new Component).should.have.property '___is_event_target'
    it 'should have "___is_component" property', -> (new Component).should.have.property '___is_component'

    describe '#___is_child', ->
      it 'should be boolean', -> (new Component).___is_child.should.be.a.Boolean
      it 'should be "true"', -> (new Component).___is_child.should.be.ok
      it 'should not be configurable', -> (isConfigurable (new Component), '___is_child').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Component), '___is_child').should.be.equal no
      it 'should not be writable', -> (isWritable (new Component), '___is_child').should.be.equal no

    describe '#___is_parent', ->
      it 'should be boolean', -> (new Component).___is_parent.should.be.a.Boolean
      it 'should be "true"', -> (new Component).___is_parent.should.be.ok
      it 'should not be configurable', -> (isConfigurable (new Component), '___is_parent').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Component), '___is_parent').should.be.equal no
      it 'should not be writable', -> (isWritable (new Component), '___is_parent').should.be.equal no

    describe '#___is_event_source', ->
      it 'should be boolean', -> (new Component).___is_event_source.should.be.a.Boolean
      it 'should be "true"', -> (new Component).___is_event_source.should.be.ok
      it 'should not be configurable', -> (isConfigurable (new Component), '___is_event_source').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Component), '___is_event_source').should.be.equal no
      it 'should not be writable', -> (isWritable (new Component), '___is_event_source').should.be.equal no

    describe '#___is_event_target', ->
      it 'should be boolean', -> (new Component).___is_event_target.should.be.a.Boolean
      it 'should be "true"', -> (new Component).___is_event_target.should.be.ok
      it 'should not be configurable', -> (isConfigurable (new Component), '___is_event_target').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Component), '___is_event_target').should.be.equal no
      it 'should not be writable', -> (isWritable (new Component), '___is_event_target').should.be.equal no

    describe '#___is_component', ->
      it 'should be boolean', -> (new Component).___is_component.should.be.a.Boolean
      it 'should be "true"', -> (new Component).___is_component.should.be.ok
      it 'should not be configurable', -> (isConfigurable (new Component), '___is_component').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Component), '___is_component').should.be.equal no
      it 'should not be writable', -> (isWritable (new Component), '___is_component').should.be.equal no

