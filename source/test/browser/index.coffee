### test: NHZ Library: browser ###

should = require 'should'
browser = require '../../browser/index'

describe 'browser', ->
  it 'should have "NextAnimationFrame" function', -> browser.NextAnimationFrame.should.be.an.instanceof Function
