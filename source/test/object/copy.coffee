### test: object.copy(source) ###

should = require 'should'
copy = require '../../object/copy'

describe 'copy(source)', ->
  it 'should be a function', ->
    copy.should.be.an.instanceof Function

  it 'should return undefined when source is undefined', ->
    should(copy()).be.equal undefined

  it 'should return an instance of Object when source is not undefined', ->
    copy({}).should.be.an.instanceof Object

  it 'should return a copy of the source', ->
    source = test:'test'
    result = copy source
    result.should.not.be.equal source
    result.test.should.be.equal source.test
