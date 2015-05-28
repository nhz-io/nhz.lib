### test: NHZ Library: property ###

should = require 'should'
property = require '../../property/index'

describe 'property', ->
  it 'should have "isEnumerable" function', -> property.isEnumerable.should.be.a.Function
  it 'should have "isConfigurable" function', -> property.isConfigurable.should.be.a.Function
  it 'should have "isWritable" function', -> property.isWritable.should.be.a.Function
  it 'should have "getter" function', -> property.getter.should.be.a.Function
  it 'should have "setter" function', -> property.setter.should.be.a.Function
  it 'should have "descriptor" function', -> property.descriptor.should.be.a.Function
