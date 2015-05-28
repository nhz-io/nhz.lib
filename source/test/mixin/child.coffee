### test: Child ###

should = require 'should'
Child = require '../../mixin/child'
isConfigurable = require '../../property/is-configurable'
isEnumerable = require '../../property/is-enumerable'
isWritable = require '../../property/is-writable'
getter = require '../../property/getter'
setter = require '../../property/setter'

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
      it 'should be a "Parent" or "null"', ->
        child = new Child
        (child.parent is null or child.parent?.___is_parent is yes).should.be.ok

      it 'should be configurable', -> (isConfigurable (new Child), 'parent').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Child), 'parent').should.be.equal yes
      it 'should have a getter', -> (getter (new Child), 'parent').should.be.a.Function
      it 'should have a setter', -> (setter (new Child), 'parent').should.be.a.Function

    describe '#___parent', ->
      it 'should be a "Parent" or "null"', ->
        child = new Child
        (child.___parent is null or child.___parent?.___is_parent is yes).should.be.ok

      it 'should not be configurable', -> (isConfigurable (new Child), '___parent').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Child), '___parent').should.be.equal no
      it 'should be writable', -> (isWritable (new Child), '___parent').should.be.equal yes

    describe '#___is_child', ->
      it 'should be boolean', -> (new Child).___is_child.should.be.a.Boolean
      it 'should not be configurable', -> (isConfigurable (new Child), '___is_child').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Child), '___is_child').should.be.equal no
      it 'should not be writable', -> (isWritable (new Child), '___is_child').should.be.equal no

    describe '#previousSibling', ->
      it 'should be configurable', -> (isConfigurable (new Child), 'previousSibling').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Child), 'previousSibling').should.be.equal yes
      it 'should have a getter', -> (getter (new Child), 'previousSibling').should.be.a.Function
      it 'should have a setter', -> (setter (new Child), 'previousSibling').should.be.a.Function

    describe '#nextSibling', ->
      it 'should be configurable', -> (isConfigurable (new Child), 'nextSibling').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Child), 'nextSibling').should.be.equal yes
      it 'should have a getter', -> (getter (new Child), 'nextSibling').should.be.a.Function
      it 'should have a setter', -> (setter (new Child), 'nextSibling').should.be.a.Function

    describe '#replaceWith()', ->
      it 'should be a stub', -> (-> (new Child).replaceWith()).should.throw 'UNIMPLEMENTED'

    describe '#remove()', ->
      it 'should be a stub', -> (-> (new Child).remove()).should.throw 'UNIMPLEMENTED'

