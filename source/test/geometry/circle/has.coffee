### test: circle.has(circle, point) ###

should = require 'should'
has = require '../../../geometry/circle/has'

describe 'has(circle, point)', ->
  it 'should be a function', ->
    has.should.be.an.instanceof Function

  it 'should return false when arguments are invalid', ->
    has().should.be.equal false
    has([]).should.be.equal false
    has([], []).should.be.equal false

    has([1,2,3]).should.be.equal false
    has([1,2,3], []).should.be.equal false
    has(undefined, [1,2]).should.be.equal false

    has([1,2],[1,2]).should.be.equal false
    has([1,2,4],[1]).should.be.equal false

    has([1,2,3,4], [1,2]).should.be.equal false
    has([1,2], [1,2,3]).should.be.equal false

  it 'should return false when point does not belong to the circle', ->
    has([0,0,2], [2.000001, 0]).should.be.equal false
    has([0,0,2], [0, 2.000001]).should.be.equal false
    has([0,0,2], [-2.000001, 0]).should.be.equal false
    has([0,0,2], [0, -2.000001]).should.be.equal false

    has([1,1,2], [3.000001, 1]).should.be.equal false
    has([1,1,2], [0, 3.000001]).should.be.equal false
    has([1,1,2], [-2.000001, 0]).should.be.equal false
    has([1,1,2], [0, -2.000001]).should.be.equal false

  it 'should return true when point belongs to the circle', ->
    has([0,0,2], [2, 0]).should.be.equal true
    has([0,0,2], [0, 2]).should.be.equal true
    has([0,0,2], [-2, 0]).should.be.equal true
    has([0,0,2], [0, -2]).should.be.equal true

    has([1,1,2], [3, 1]).should.be.equal true
    has([1,1,2], [1, 3]).should.be.equal true
    has([1,1,2], [-1, 1]).should.be.equal true
    has([1,1,2], [1, -1]).should.be.equal true

    has([0,0,2], [1.3, 1.3]).should.be.equal true
    has([0,0,2], [1.3, -1.3]).should.be.equal true
    has([0,0,2], [-1.3, 1.3]).should.be.equal true
    has([0,0,2], [-1.3, -1.3]).should.be.equal true

    has([1,1,2], [2.3, 2.3]).should.be.equal true
    has([1,1,2], [2.3, -0.3]).should.be.equal true
    has([1,1,2], [-0.3, 2.3]).should.be.equal true
    has([1,1,2], [-0.3, -0.3]).should.be.equal true
