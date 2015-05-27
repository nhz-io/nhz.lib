### test: browser.NextAnimationFrame(callbacks...) ###

require '../stage'
should = require 'should'
NextAnimationFrame = require '../../browser/next-animation-frame'


describe 'NextAnimationFrame(callbacks...)', ->
  it 'should be a function', ->
    NextAnimationFrame.should.be.an.instanceof Function

  it 'should return an instance of NextAnimationFrame', ->
    NextAnimationFrame().should.be.an.instanceof NextAnimationFrame

  it 'should call the callbacks', (done) ->
    NextAnimationFrame null, null, -> done()

describe 'NextAnimationFrame', ->
  describe '#then(callbacks...)', ->
    it 'should return an instance of NextAnimationFrame', ->
      NextAnimationFrame().then().should.be.an.instanceof NextAnimationFrame

    it 'should call the callbacks', (done) -> NextAnimationFrame().then -> done()

    it 'should call the previous callbacks first', (done) ->
      result = 0
      NextAnimationFrame -> result = -1
      .then -> result = result * (-1)
      .then ->
        result.should.be.equal 1
        done()

    it 'should call the previous callbacks in different frame', (done) ->
      result = 0
      global.requestAnimationFrame = (callback) -> setTimeout ->
        result = result * -1
        callback()

      NextAnimationFrame -> result = -1
      .then ->
        result.should.be.equal 1
        done()


