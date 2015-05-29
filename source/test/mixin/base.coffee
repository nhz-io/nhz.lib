### test: mixin.Base ###

should = require 'should'
Base = require '../../mixin/base'

describe 'Base', ->
  it 'should be a class', ->
    Base.should.be.a.Function
    Base::constructor.should.be.equal Base

  describe '#constructor()', ->
    it 'should return an instance of Base', -> (new Base).should.be.an.instanceof Base

  describe 'instance', ->
    it 'should be empty', -> (new Base).should.be.empty
