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

    describe '#___parent', ->
      it 'should be a "Parent" or "null"', ->
        child = new Child
        (child.___parent is null or child.___parent?.___is_parent is yes).should.be.ok

      it 'should not be configurable', -> (isConfigurable (new Child), '___parent').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Child), '___parent').should.be.equal no
      it 'should be writable', -> (isWritable (new Child), '___parent').should.be.equal yes

    describe '#parent', ->
      it 'should be a "Parent" or "null"', ->
        child = new Child
        (child.parent is null or child.parent?.___is_parent is yes).should.be.ok

      it 'should be configurable', -> (isConfigurable (new Child), 'parent').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Child), 'parent').should.be.equal yes
      it 'should have a getter', -> (getter (new Child), 'parent').should.be.a.Function
      it 'should have a setter', -> (setter (new Child), 'parent').should.be.a.Function

      describe 'getter', -> it 'should return the value of ___parent', ->
        (child = new Child).___parent = 'test'
        child.parent.should.be.equal child.___parent

      describe 'setter', ->
        it 'should not change "___parent" if "value" is not "Parent" (property ___is_parent is not "true")', ->
          (child = new Child).___parent = (parent = ___is_parent:yes, removeChild: ->)
          child.parent = 'test'
          child.___parent.should.be.equal parent

        it 'should set "___parent" to the "value" if "value" is "Parent"', ->
          (child = new Child).parent = ___is_parent:yes, appendChild: ->
          child.___parent.should.be.ok

        it 'should set "___parent" to "null" if "value" is "null"', ->
          (child = new Child).parent = ___is_parent:yes, removeChild: ->
          child.parent = null
          should(child.___parent).be.null

        it 'should set "___parent" to "null" if "value" is "undefined"', ->
          (child = new Child).parent = ___is_parent:yes, removeChild: ->
          child.parent = undefined
          should(child.___parent).be.null

        it 'should call "removeChild()" on "___parent" if "value" is "null" and "___parent" is set', ->
          pass = no
          (child = new Child).___parent = ___is_parent:yes, removeChild: -> pass = yes
          child.parent = null
          pass.should.be.ok

        it 'should call "removeChild()" on "___parent" if "value" is "undefined" and "___parent" is set', ->
          pass = no
          (child = new Child).___parent = ___is_parent:yes, removeChild: -> pass = yes
          child.parent = undefined
          pass.should.be.ok

        it 'should call "removeChild()" on "___parent" if "value" is "Parent" and "___parent" is set', ->
          pass = no
          (child = new Child).___parent = ___is_parent:yes, removeChild: -> pass = yes
          child.parent = ___is_parent:yes, appendChild: ->
          pass.should.be.ok

        it 'should not call "removeChild() for any other "value"', ->
          pass = yes
          (child = new Child).___parent = ___is_parent:yes, removeChild: -> pass = no
          child.parent = 'test'
          pass.should.be.ok

        it 'should not call "removeChild() if "___parent" is "value"', ->
          pass = yes
          (child = new Child).___parent = (parent = ___is_parent:yes, removeChild: -> pass = no)
          child.parent = parent
          pass.should.be.ok

        it 'should pass itself as first argument to "removeChild()" if "value" is "null" and "___parent" is set', ->
          result = 'fail'
          (child = new Child).___parent = ___is_parent:yes, removeChild: (value) -> result = value
          child.parent = null
          result.should.be.equal child

        it 'should pass itself as first argument to "removeChild()" if "value" is "undefined" and "___parent" is set', ->
          result = 'fail'
          (child = new Child).___parent = ___is_parent:yes, removeChild: (value) -> result = value
          child.parent = undefined
          result.should.be.equal child

        it 'should pass itself as first argument to "removeChild()" if "value" is "Parent" and "___parent" is set', ->
          result = 'fail'
          (child = new Child).___parent = ___is_parent:yes, removeChild: (value) -> result = value
          child.parent = ___is_parent:yes
          result.should.be.equal child

        it 'should set the "___parent" to "null" before calling "removeChild()"', ->
          pass = no
          (child = new Child).___parent = ___is_parent:yes, removeChild: (value) -> pass = (value.___parent is null)
          child.parent = null

        it 'should set the "___parent" to "value" before calling "removeChild()"', ->
          pass = no
          parent = ___is_parent:yes, appendChild: ->
          (child = new Child).___parent = ___is_parent:yes, removeChild: (value) -> pass = (value.___parent is parent)
          child.parent = parent

        it 'should call "appendChild" on "value" if "value" is "Parent" (property ___is_parent is "true")', ->
          pass = no
          (new Child).parent = ___is_parent:yes, appendChild: -> pass = yes
          pass.should.be.ok

        it 'should pass itself as first argument to "appendChild()"', ->
          pass = no
          (child = new Child).parent = ___is_parent:yes, appendChild: (newChild) -> pass = (newChild is child)
          pass.should.be.ok

        it 'should set the "___parent" to "value" before calling "appendChild()"', ->
          pass = no
          parent = ___is_parent:yes, appendChild:(value) -> pass = (value.___parent is parent)
          (new Child).parent = parent
          pass.should.be.ok

    describe '#___is_child', ->
      it 'should be boolean', -> (new Child).___is_child.should.be.a.Boolean
      it 'should not be configurable', -> (isConfigurable (new Child), '___is_child').should.be.equal no
      it 'should not be enumerable', -> (isEnumerable (new Child), '___is_child').should.be.equal no
      it 'should not be writable', -> (isWritable (new Child), '___is_child').should.be.equal no

    describe '#previousSibling', ->
      it 'should be configurable', -> (isConfigurable (new Child), 'previousSibling').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Child), 'previousSibling').should.be.equal yes
      it 'should have a getter', -> (getter (new Child), 'previousSibling').should.be.a.Function
      it 'should not have a setter', -> should(setter (new Child), 'previousSibling').not.be.ok

      describe 'getter', ->
        it 'should call previousChild() on ___parent', ->
          pass = no
          (child = new Child).parent = ___is_parent:yes, previousChild: -> pass = yes
          child.previousSibling
          pass.should.be.ok

        it 'should pass itself as first argument to previousChild() of the ____parent', ->
          pass = no
          (child = new Child).parent = ___is_parent:yes, previousChild:(value) -> pass = (value is child)
          test = child.previousSibling
          pass.should.be.ok

        it 'should return the result of the previousChild() call', ->
          (child = new Child).parent = ___is_parent:yes, previousChild: -> 'pass'
          child.previousSibling.should.be.equal 'pass'

    describe '#nextSibling', ->
      it 'should be configurable', -> (isConfigurable (new Child), 'nextSibling').should.be.equal yes
      it 'should be enumerable', -> (isEnumerable (new Child), 'nextSibling').should.be.equal yes
      it 'should have a getter', -> (getter (new Child), 'nextSibling').should.be.a.Function
      it 'should not have a setter', -> should(setter (new Child), 'previousSibling').not.be.ok

      describe 'getter', ->
        it 'should call nextChild() on ___parent', ->
          pass = no
          (child = new Child).parent = ___is_parent:yes, nextChild: -> pass = yes
          child.nextSibling
          pass.should.be.ok

        it 'should pass itself as first argument to nextChild() of the ____parent', ->
          pass = no
          (child = new Child).parent = ___is_parent:yes, nextChild:(value) -> pass = (value is child)
          test = child.nextSibling
          pass.should.be.ok

        it 'should return the result of the nextChild() call', ->
          (child = new Child).parent = ___is_parent:yes, nextChild: -> 'pass'
          child.nextSibling.should.be.equal 'pass'


    describe '#replaceWith(child)', ->
      it 'should return itself', -> (child = new Child).replaceWith(new Child).should.be.equal child

      it 'should call "replaceChild()" of the ___parent', ->
        pass = no
        (child = new Child).parent = ___is_parent:yes, replaceChild: -> pass = yes
        child.replaceWith ___is_child:yes
        pass.should.be.ok

      it 'should pass itself as first argument to "replaceChild()"', ->
        result = 'fail'
        (child = new Child).parent = ___is_parent:yes, replaceChild: -> result = arguments[0]
        child.replaceWith ___is_child:yes
        result.should.be.equal child

      it 'should pass the "child" as second argument to "replaceChild()"', ->
        pass = no
        child = new Child
        (test = new Child).parent = ___is_parent:yes, replaceChild: -> pass = (child is arguments[1])
        test.replaceWith child
        pass.should.be.ok

      it 'should set "___parent" to "null"', ->
        (test = new Child).parent = ___is_parent:yes
        test.replaceWith new Child
        should(test.___parent).be.null

      it 'should set "___parent" to "null" before calling "replaceChild()"', ->
        pass = no
        (test = new Child).parent = ___is_parent:yes, replaceChild: (value) -> pass = (value.___parent is null)
        test.replaceWith new Child
        pass.should.be.ok

      it 'should not change the "___parent" if "child" is not "Child"', ->
        parent = ___is_parent:yes
        (test = new Child).parent = parent
        test.replaceWith {}
        test.___parent.should.be.equal parent
        test.replaceWith undefined
        test.___parent.should.be.equal parent
        test.replaceWith null
        test.___parent.should.be.equal parent

      it 'should not call "replaceChild()" if "child" is not "Child"', ->
        pass = yes
        (test = new Child).parent = ___is_parent:yes, replaceChild: -> pass = no
        test.replaceWith {}
        pass.should.be.ok
        test.replaceWith undefined
        pass.should.be.ok
        test.replaceWith null
        pass.should.be.ok

      it 'should not set "___parent" to "null" if both children have same ___parent', ->
        parent = ___is_parent:yes, replaceChild: -> pass = no
        (child = new Child).parent = parent
        (test = new Child).parent = parent
        test.replaceWith child
        test.___parent.should.not.be.null

      it 'should not change "___parent" if both children have same ___parent', ->
        parent = ___is_parent:yes, replaceChild: -> pass = no
        (child = new Child).parent = parent
        (test = new Child).parent = parent
        test.replaceWith child
        test.___parent.should.be.equal parent

      it 'should not call "replaceChild() if both children have same ___parent', ->
        pass = yes
        parent = ___is_parent:yes, replaceChild: -> pass = no
        (child = new Child).parent = parent
        (test = new Child).parent = parent
        test.replaceWith child
        pass.should.be.ok

    describe '#remove()', ->
      it 'should return instance of "Child"', -> (child = new Child).remove().should.be.equal child

      it 'should set "___parent" to "null"', ->
        (child = new Child).___parent = ___is_parent:yes
        should(child.remove().___parent).be.null

      it 'should call "removeChild()" of the "___parent"', ->
        pass = no
        (child = new Child).___parent = ___is_parent:yes, removeChild: -> pass = yes
        child.remove()
        pass.should.be.ok

      it 'should set "___parent" to "null" before calling "removeChild()"', ->
        pass = no
        (child = new Child).___parent = ___is_parent:yes, removeChild: -> pass = (child is null)
        child.remove()
        pass.should.be.ok
