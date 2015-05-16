### test: array.copy(source) ###

should = require 'should'
copy = require '../../array/copy'

describe 'copy(source)', ->
  it 'should be a function', ->
    copy.should.be.an.instanceof Function

  it 'should return undefined when source is undefined', ->
    should(copy()).be.equal undefined

  it 'should return an instance of Array when source is not undefined', ->
    copy([]).should.be.an.instanceof Array

  it 'should return a copy of the source', ->
    source = ['test']
    result = copy source
    result.should.not.be.equal source
    result[0].should.be.equal source[0]
