### test: Parent ###

should = require 'should'
Parent = require '../../mixin/parent'

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

    it 'should have "hasChildren()" method', -> (new Parent).hasChildren.should.be.a.Function

    describe '#children', ->

    describe '#___children', ->

    describe '#___is_parent', ->

    describe '#appendChild()', ->
      it 'should be a stub', -> (-> (new Parent).appendChild()).should.throw 'UNIMPLEMENTED'

    describe '#removeChild()', ->
      it 'should be a stub', -> (-> (new Parent).removeChild()).should.throw 'UNIMPLEMENTED'

    describe '#replaceChild()', ->
      it 'should be a stub', -> (-> (new Parent).replaceChild()).should.throw 'UNIMPLEMENTED'

    describe '#firstChild()', ->
      it 'should be a stub', -> (-> (new Parent).firstChild()).should.throw 'UNIMPLEMENTED'

    describe '#lastChild()', ->
      it 'should be a stub', -> (-> (new Parent).lastChild()).should.throw 'UNIMPLEMENTED'

    describe '#nextChild()', ->
      it 'should be a stub', -> (-> (new Parent).nextChild()).should.throw 'UNIMPLEMENTED'

    describe '#previousChild()', ->
      it 'should be a stub', -> (-> (new Parent).previousChild()).should.throw 'UNIMPLEMENTED'

    describe '#insertBefore()', ->
      it 'should be a stub', -> (-> (new Parent).insertBefore()).should.throw 'UNIMPLEMENTED'

    describe '#insertAfter()', ->
      it 'should be a stub', -> (-> (new Parent).insertAfter()).should.throw 'UNIMPLEMENTED'

    describe '#hasChild()', ->
      it 'should be a stub', -> (-> (new Parent).hasChild()).should.throw 'UNIMPLEMENTED'

    describe '#hasChildren()', ->
      it 'should be a stub', -> (-> (new Parent).hasChildren()).should.throw 'UNIMPLEMENTED'

