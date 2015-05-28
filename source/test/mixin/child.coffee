### test: Child ###

should = require 'should'
Child = require '../../mixin/child'

describe 'Child', ->
  it 'should be a class', ->
    Child.should.be.a.Function
    Child::constructor.should.be.equal Child

  describe '#constructor()', ->
    it 'should return an instance of Child', -> (new Child).should.be.an.instanceof Child

  describe 'instance', ->

    it 'should have "parent" property', -> (new Child).should.have.property 'parent'

    it 'should have "previousSibling" property', -> (new Child).should.have.property 'previousSibling'

    it 'should have "nextSibling" property', -> (new Child).should.have.property 'nextSibling'

    it 'should have "___is_child" property', -> (new Child).should.have.property '___is_child'

    it 'should have "___parent" property', -> (new Child).should.have.property '___parent'

    it 'should have "replaceWith()" method', -> (new Child).replaceWith.should.be.a.Function

    it 'should have "remove()" method', -> (new Child).remove.should.be.a.Function

    describe '#parent', ->

    describe '#previousSibling', ->

    describe '#nextSibling', ->

    describe '#___is_child', ->

    describe '#___parent', ->

    describe '#replaceWith()', ->
      it 'should be a stub', -> (-> (new Child).replaceWith()).should.throw 'UNIMPLEMENTED'

    describe '#remove()', ->
      it 'should be a stub', -> (-> (new Child).remove()).should.throw 'UNIMPLEMENTED'

