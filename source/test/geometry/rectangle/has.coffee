### test: rectangle.has(rectangle, point) ###

should = require 'should'
has = require '../../../geometry/rectangle/has'

describe 'has(rectangle, point)', ->
  it 'should be a function', ->
    has.should.be.an.instanceof Function

  it 'should return false when arguments are invalid', ->
    has().should.be.equal false
    has([]).should.be.equal false
    has([], []).should.be.equal false

    has([1,2,3,4]).should.be.equal false
    has([1,2,3,4], []).should.be.equal false
    has(undefined, [1,2]).should.be.equal false

    has([1,2,3],[1,2]).should.be.equal false
    has([1,2,3,4],[1]).should.be.equal false

    has([1,2,3,4,5], [1,2]).should.be.equal false
    has([1,2,3,4], [1,2,3]).should.be.equal false

  it 'should return false when point does not belong to the rectangle', ->
    has([0,0,2,2], [2.000001, 2]).should.be.equal false
    has([0,0,2,2], [2.000001, 2.000001]).should.be.equal false
    has([0,0,2,2], [2, 2.000001]).should.be.equal false

    has([1,1,2,2], [3.000001, 3]).should.be.equal false
    has([1,1,2,2], [3.000001, 3.000001]).should.be.equal false
    has([1,1,2,2], [3, 3.000001]).should.be.equal false

  it 'should return true when point belongs to the rectangle', ->
    has([0,0,2,2], [1.5, 1.5]).should.be.equal true
    has([0,0,2,2], [0,0]).should.be.equal true
    has([0,0,2,2], [2,2]).should.be.equal true

    has([1,1,2,2], [2.5, 2.5]).should.be.equal true
    has([1,1,2,2], [1,1]).should.be.equal true
    has([1,1,2,2], [3,3]).should.be.equal true
