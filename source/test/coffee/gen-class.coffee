### test: coffee.genClass(callbacks...) ###

require '../stage'
should = require 'should'
genClass = require '../../coffee/gen-class'


describe 'genClass(args)', ->
  it 'should be a function', ->
    genClass.should.be.a.Function

  it 'should return a string', -> genClass().should.be.a.String

  it 'should generate a class stub (coffee + compatible with class test stub)', ->
    result = genClass
      name: 'Test'
      ancestors: ['A1', 'A2']
      staticProperties:['sp1', 'sp2']
      staticMethods:['sm1', 'sm2']
      properties: ['p1', 'p2']
      methods: ['m1', 'm2']

    (result.replace /^\s*\n/gmi, '').should.be.equal """
      ### Test ###
      module.exports = class Test extends [ A1, A2 ]
        Object.defineProperties Test,
          sp1: configurable:yes, enumerable:yes, writable:yes, value:null, get: (->), set: (->)
          sp2: configurable:yes, enumerable:yes, writable:yes, value:null, get: (->), set: (->)
        @sm1 = -> throw new Error 'UNIMPLEMENTED'
        @sm2 = -> throw new Error 'UNIMPLEMENTED'
        constructor: ->
          Object.defineProperties this,
            p1: configurable:yes, enumerable:yes, writable:yes, value:null, get: (->), set: (->)
            p2: configurable:yes, enumerable:yes, writable:yes, value:null, get: (->), set: (->)
        m1: -> throw new Error 'UNIMPLEMENTED'
        m2: -> throw new Error 'UNIMPLEMENTED'

      """
