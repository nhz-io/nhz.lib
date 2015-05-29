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

    describe '#appendChild(newChild)', ->
      it 'should do nothing if "newChild" is not "Component" (___is_component is not "true")', ->
        (new Component).appendChild({}).children.length.should.be.equal 0

    describe '#removeChild(child)', ->
      it 'should do nothing if "newChild" is not "Component" (___is_component is not "true")', ->
        (new Component).appendChild(new Component).removeChild({}).children.length.should.be.equal 1

    describe '#replaceChild(child, withChild)', ->
      it 'should do nothing if "child" or "withChild" is not "Component" (___is_component is not "true")', ->
        (new Component)
          .appendChild(child = new Component)
          .replaceChild(child, {})
          .children[0].should.be.equal child

    describe '#nextChild(child)', ->
      it 'should return null if "child" is not "Component" (___is_component is not "true")', ->
        should((new Component).appendChild(new Component).nextChild {}).be.null

    describe '#previousChild(child)', ->
      it 'should return null if "child" is not "Component" (___is_component is not "true")', ->
        should((new Component).appendChild(new Component).previousChild {}).be.null

    describe '#insertBefore(child, newChild)', ->
      it 'should do nothing if "child" or "newChild" is not "Component" (___is_component is not "true")', ->
        (new Component)
          .appendChild(child = new Component)
          .insertBefore(child, {})
          .children[0].should.be.equal child

    describe '#insertAfter(child, newChild)', ->
      it 'should do nothing if "child" or "newChild" is not "Component" (___is_component is not "true")', ->
        (new Component)
          .appendChild(child = new Component)
          .insertAfter(child, {})
          .children.length.should.be.equal 1

    describe '#hasChild(child)', ->
      it 'should return "null" if "child" is not "Component" (___is_component property is not "true")', ->
        should((new Component).appendChild(new Component).hasChild {}).be.null

    describe '#dispatchEvent(event)', ->
      it 'should return own "Component" instance', -> (test = new Component).dispatchEvent().should.be.equal test

    describe '#emitEvent(event, target = this)', ->
      it 'should return own "Component" instance', -> (test = new Component).emitEvent().should.be.equal test
      it 'should emit event to target', ->
        pass = no
        (new Component).emitEvent (event = ___is_event:yes),
          ___is_event_target:yes, ___is_component:yes, dispatchEvent: (e) -> pass = (e is event)
        pass.should.be.ok

      it 'should not emit event if target is not "Component"', ->
        pass = yes
        (new Component).emitEvent (event = ___is_event:yes),
          ___is_event_target:yes, dispatchEvent: pass = no
        pass.should.be.ok
