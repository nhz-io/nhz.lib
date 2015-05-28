### test: NHZ Library: mixin ###

should = require 'should'
mixin = require '../../mixin/index'

describe 'mixin', ->
  it 'should have "Parent" function', -> mixin.Parent.should.be.a.Function
  it 'should have "Child" function', -> mixin.Child.should.be.a.Function
