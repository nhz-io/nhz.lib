### test: mixin.Parent ###

should = require 'should'
Parent = require '../../mixin/parent'
Child = require '../../mixin/child'
isConfigurable = require '../../property/is-configurable'
isEnumerable = require '../../property/is-enumerable'
isWritable = require '../../property/is-writable'

describe 'Parent', ->
  it 'should be a class', ->
    Parent.should.be.a.Function
    Parent::constructor.should.be.equal Parent

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
      it 'should not be writable', -> (isWritable (new Parent), '___children').should.be.equal no

    describe '#___is_parent', ->
      it 'should be boolean', -> (new Parent).___is_parent.should.be.a.Boolean
      it 'should not be configurable', -> (isConfigurable (new Parent), '___is_parent').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Parent), '___is_parent').should.be.equal no
      it 'should not be writable', -> (isWritable (new Parent), '___is_parent').should.be.equal no

    describe '#appendChild(newChild)', ->
      it 'should do nothing if newChild is not "Child" (___is_child property is not "true")', ->
      it 'should return the "Parent" instance', -> (test = new Parent).appendChild().should.be.equal test
      it 'should append the "newChild" to "____children"', ->
      it 'should not append duplicates', ->

    describe '#removeChild(child)', ->
      it 'should do nothing if child is not "Child" (___is_child property is not "true")', ->
      it 'should return the "Parent" instance', -> (test = new Parent).appendChild().should.be.equal test

    describe '#replaceChild(child, withChild)', ->
      it 'should do nothing if child is not "Child" (___is_child property is not "true")', ->
      it 'should do nothing if withChild is not "Child" (___is_child property is not "true")', ->
      it 'should return the "Parent" instance', -> (test = new Parent).appendChild().should.be.equal test

    describe '#firstChild()', ->
      it 'should return null if there are no children', -> (test = new Parent).appendChild().should.be.equal test
      it 'should return the "Child" instance', -> (test = new Parent).appendChild().should.be.equal test

    describe '#lastChild()', ->
      it 'should return null if there are no children', -> (test = new Parent).appendChild().should.be.equal test
      it 'should return the "Child" instance', -> (test = new Parent).appendChild().should.be.equal test

    describe '#nextChild(child)', ->
      it 'should do nothing if child is not "Child" (___is_child property is not "true")', ->
      it 'should return null if there are no children', -> (test = new Parent).appendChild().should.be.equal test
      it 'should return null if there is no "child"', -> (test = new Parent).appendChild().should.be.equal test
      it 'should return null if there are no children after "child"', -> (test = new Parent).appendChild().should.be.equal test
      it 'should return the "Child" instance which comes after "child', -> (test = new Parent).appendChild().should.be.equal test

    describe '#previousChild(child)', ->
      it 'should do nothing if child is not "Child" (___is_child property is not "true")', ->
      it 'should return null if there are no children', -> (test = new Parent).appendChild().should.be.equal test
      it 'should return null if there is no "child"', -> (test = new Parent).appendChild().should.be.equal test
      it 'should return null if there are no children before "child"', -> (test = new Parent).appendChild().should.be.equal test
      it 'should return the "Child" instance which comes before "child', -> (test = new Parent).appendChild().should.be.equal test

    describe '#insertBefore(child, newChild)', ->
      it 'should do nothing if child is not "Child" (___is_child property is not "true")', ->
      it 'should do nothing if newChild is not "Child" (___is_child property is not "true")', ->
      it 'should return an instance of "Parent"', ->
      it 'should do nothing if there are no children', -> (test = new Parent).appendChild().should.be.equal test
      it 'should do nothing if there is no "child"', -> (test = new Parent).appendChild().should.be.equal test
      it 'should move the "newChild" before "child" if "newChild" exists', ->
      it 'should insert the "newChild" before "child"', ->

    describe '#insertAfter(child, newChild)', ->
      it 'should do nothing if child is not "Child" (___is_child property is not "true")', ->
      it 'should do nothing if newChild is not "Child" (___is_child property is not "true")', ->
      it 'should return an instance of "Parent"', ->
      it 'should do nothing if there are no children', -> (test = new Parent).appendChild().should.be.equal test
      it 'should do nothing if there is no "child"', -> (test = new Parent).appendChild().should.be.equal test
      it 'should move the "newChild" after "child" if "newChild" exists', ->
      it 'should insert the "newChild" after "child"', ->

    describe '#hasChild(child)', ->
      it 'should return "null" if "child" is not "Child" (___is_child property is not "true")', ->
      it 'should return "true" if "child" exists', ->
      it 'should return "false" if "child" does not exist', ->
