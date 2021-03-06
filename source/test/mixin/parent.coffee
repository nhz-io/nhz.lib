### test: mixin.Parent ###

should = require 'should'
Base = require '../../mixin/base'
Parent = require '../../mixin/parent'
isConfigurable = require '../../property/is-configurable'
isEnumerable = require '../../property/is-enumerable'
isWritable = require '../../property/is-writable'

describe 'Parent', ->
  it 'should be a class', ->
    Parent.should.be.a.Function
    Parent::constructor.should.be.equal Parent

  it 'should be a subclass of Base', -> (Object.create Parent::).should.be.an.instanceof Base

  describe '#constructor()', ->
    it 'should return an instance of Parent', -> (new Parent).should.be.an.instanceof Parent

  describe 'instance', ->

    it 'should have "children" property', -> (new Parent).should.have.property 'children'

    it 'should have "___children" property', -> (new Parent).should.have.property '___children'

    it 'should have "___is_parent" property', -> (new Parent).should.have.property '___is_parent'

    it 'should have "appendChild()" method', -> (new Parent).appendChild.should.be.a.Function

    it 'should have "removeChild()" method', -> (new Parent).removeChild.should.be.a.Function

    it 'should have "replaceChild()" method', -> (new Parent).replaceChild.should.be.a.Function

    it 'should have "firstChild()" method', -> (new Parent).firstChild.should.be.a.Function

    it 'should have "lastChild()" method', -> (new Parent).lastChild.should.be.a.Function

    it 'should have "nextChild()" method', -> (new Parent).nextChild.should.be.a.Function

    it 'should have "previousChild()" method', -> (new Parent).previousChild.should.be.a.Function

    it 'should have "insertBefore()" method', -> (new Parent).insertBefore.should.be.a.Function

    it 'should have "insertAfter()" method', -> (new Parent).insertAfter.should.be.a.Function

    it 'should have "hasChild()" method', -> (new Parent).hasChild.should.be.a.Function

    describe '#children', ->
      it 'should be an array', -> (new Parent).children.should.be.an.Array
      it 'should be configurable', -> (isConfigurable (new Parent), 'children').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Parent), 'children').should.be.equal yes
      it 'should not be writable', -> (isWritable (new Parent), 'children').should.be.equal no
      it 'should not be "____children" property', -> (test = new Parent).children.should.not.be.equal test.___children
      it 'should be a copy of "____children" property', ->
        (test = new Parent).___children.push 'test'
        test.children[0].should.be.equal 'test'

    describe '#___children', ->
      it 'should be an array', -> (new Parent).___children.should.be.an.Array
      it 'should not be configurable', -> (isConfigurable (new Parent), '___children').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Parent), '___children').should.be.equal no
      it 'should be writable', -> (isWritable (new Parent), '___children').should.be.equal no

    describe '#___is_parent', ->
      it 'should be boolean', -> (new Parent).___is_parent.should.be.a.Boolean
      it 'should not be configurable', -> (isConfigurable (new Parent), '___is_parent').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Parent), '___is_parent').should.be.equal no
      it 'should not be writable', -> (isWritable (new Parent), '___is_parent').should.be.equal no

    describe '#appendChild(newChild)', ->
      it 'should return the "Parent" instance', -> (test = new Parent).appendChild().should.be.equal test

      it 'should do nothing if "newChild" is not "Child" (___is_child property is not "true")', ->
        (new Parent).appendChild(test:'test').___children.length.should.be.equal 0

      it 'should append the "newChild" to "____children"', ->
        child = ___is_child:yes
        (test = new Parent).appendChild(child).___children.length.should.be.equal 1
        test.___children[0].should.be.equal child

      it 'should not append duplicates', ->
        child = ___is_child:yes
        (new Parent).appendChild(child).appendChild(child).___children.length.should.be.equal 1

    describe '#removeChild(child)', ->
      it 'should return the "Parent" instance', -> (test = new Parent).removeChild().should.be.equal test

      it 'should do nothing if "child" is not "Child" ("___is_child" property is not "true")', ->
        (test = new Parent).___children[0] = (child = {})
        (test.removeChild child).___children[0].should.be.equal child

      it 'should remove the child', ->
        (test = new Parent).___children[0] = (child = ___is_child:yes)
        (test.removeChild child).___children.length.should.be.equal 0

    describe '#replaceChild(child, withChild)', ->
      it 'should return the "Parent" instance', -> (test = new Parent).replaceChild().should.be.equal test

      it 'should do nothing if "child" is not "Child" ("___is_child" property is not "true")', ->
        (test = new Parent).___children[0] = (child = {})
        (test.replaceChild child, ___is_child:yes).___children[0].should.be.equal child

      it 'should do nothing if "withChild" is not "Child" ("___is_child" property is not "true")', ->
        (test = new Parent).___children[0] = (child = ___is_child:true)
        (test.replaceChild child, {}).___children[0].should.be.equal child

      it 'should replace the "child" with "withChild"', ->
        (test = new Parent).___children[0] = (child = ___is_child:true)
        (test.replaceChild child, (withChild = ___is_child:true)).___children[0].should.be.equal withChild
        test.___children.length.should.be.equal 1

    describe '#firstChild()', ->
      it 'should return null if there are no children', -> should((new Parent).firstChild()).be.null
      it 'should return the "Child" instance', ->
        (test = new Parent)
          .appendChild first = ___is_child:yes
          .appendChild last = ___is_child:yes
          .firstChild()
          .should.be.equal first

    describe '#lastChild()', ->
      it 'should return null if there are no children', -> should((new Parent).lastChild()).be.null
      it 'should return the "Child" instance', ->
        (test = new Parent)
          .appendChild first = ___is_child:yes
          .appendChild last = ___is_child:yes
          .lastChild()
          .should.be.equal last

    describe '#nextChild(child)', ->
      it 'should do nothing if child is not "Child" (___is_child property is not "true")', ->
        should((new Parent).nextChild {}).not.be.ok

      it 'should return null if there are no children', -> should((new Parent).nextChild ___is_child:yes).be.null

      it 'should return null if there is no "child"', -> should((new Parent).appendChild(___is_child:yes).nextChild()).be.null

      it 'should return null if there are no children after "child"', ->
        should((new Parent).appendChild(child = ___is_child:yes).nextChild child).be.null

      it 'should return the "Child" instance which comes after "child', ->
        (new Parent)
          .appendChild child = ___is_child:yes
          .appendChild next = ___is_child:yes
          .nextChild child
          .should.be.equal next

    describe '#previousChild(child)', ->
      it 'should do nothing if child is not "Child" (___is_child property is not "true")', ->
        should((new Parent).previousChild {}).not.be.ok

      it 'should return null if there are no children', -> should((new Parent).previousChild ___is_child:yes).be.null

      it 'should return null if there is no "child"', -> should((new Parent).appendChild(___is_child:yes).previousChild()).be.null

      it 'should return null if there are no children before "child"', ->
        should((new Parent).appendChild(child = ___is_child:yes).previousChild child).be.null

      it 'should return the "Child" instance which comes before "child', ->
        (new Parent)
          .appendChild previous = ___is_child:yes
          .appendChild child =___is_child:yes
          .previousChild child
          .should.be.equal previous

    describe '#insertBefore(child, newChild)', ->
      it 'should return an instance of "Parent"', -> (test = new Parent).insertBefore().should.be.equal test

      it 'should do nothing if child is not "Child" (___is_child property is not "true")', ->
        (new Parent).insertBefore({}, ___is_child:yes).___children.length.should.be.equal 0

      it 'should do nothing if newChild is not "Child" (___is_child property is not "true")', ->
        (new Parent)
          .appendChild child = ___is_child:yes
          .insertBefore child, {}
          .___children.length.should.be.equal 1

      it 'should do nothing if there are no children', ->
        (new Parent)
          .insertBefore {___is_child:yes}, {___is_child:yes}
          .___children.length.should.be.equal 0

      it 'should do nothing if there is no "child"', ->
        (new Parent)
          .appendChild ___is_child:yes
          .insertBefore {___is_child:yes}, {___is_child:yes}
          .___children.length.should.be.equal 1

      it 'should move the "newChild" before "child" if "newChild" exists', ->
        (new Parent)
          .appendChild child = ___is_child:yes
          .appendChild newChild = ___is_child:yes
          .insertBefore child, newChild
          .___children[0].should.be.equal newChild

      it 'should insert the "newChild" before "child"', ->
        (new Parent)
          .appendChild child = ___is_child:yes
          .insertBefore child, newChild = ___is_child:yes
          .___children[0].should.be.equal newChild

    describe '#insertAfter(child, newChild)', ->
      it 'should return an instance of "Parent"', -> (test = new Parent).insertAfter().should.be.equal test

      it 'should do nothing if child is not "Child" (___is_child property is not "true")', ->
        (new Parent)
          .appendChild ___is_child:yes
          .insertAfter {}, ___is_child:yes
          .___children.length.should.be.equal 1

      it 'should do nothing if newChild is not "Child" (___is_child property is not "true")', ->
        (new Parent)
          .appendChild child = ___is_child:yes
          .insertAfter child, {}
          .___children.length.should.be.equal 1

      it 'should do nothing if there are no children', ->
        (new Parent)
          .insertAfter {___is_child:yes}, {___is_child:yes}
          .___children.length.should.be.equal 0

      it 'should do nothing if there is no "child"', ->
        (new Parent)
          .appendChild ___is_child:yes
          .insertAfter {___is_child:yes}, {___is_child:yes}
          .___children.length.should.be.equal 1

      it 'should move the "newChild" after "child" if "newChild" exists', ->
        (new Parent)
          .appendChild newChild = ___is_child:yes
          .appendChild child = ___is_child:yes
          .insertAfter child, newChild
          .___children[1].should.be.equal newChild

      it 'should insert the "newChild" after "child"', ->
        (new Parent)
          .appendChild child = ___is_child:yes
          .insertAfter child, newChild = ___is_child:yes
          .___children[1].should.be.equal newChild

    describe '#hasChild(child)', ->
      it 'should return "null" if "child" is not "Child" (___is_child property is not "true")', ->
        should((new Parent).nextChild {}).be.null

      it 'should return "true" if "child" exists', ->
        (new Parent).appendChild(child = ___is_child:yes).hasChild(child).should.be.yes

      it 'should return "false" if "child" does not exist', ->
        (new Parent).appendChild(child = ___is_child:yes).removeChild(child).hasChild(child).should.be.no
