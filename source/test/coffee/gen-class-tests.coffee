### test: coffee.genClassTests(callbacks...) ###

require '../stage'
should = require 'should'
genClassTests = require '../../coffee/gen-class-tests'


describe 'genClassTests(args)', ->
  it 'should be a function', ->
    genClassTests.should.be.a.Function

  it 'should return a string', -> genClassTests().should.be.a.String

  it 'should generate a stub for class test (coffee + mocha + should)', ->
    result = genClassTests
      name: 'Test'
      ancestors: ['A1', 'A2']
      staticProperties:['sp1', 'sp2']
      staticMethods:['sm1', 'sm2']
      properties: ['p1', 'p2']
      methods: ['m1', 'm2']

    (result.replace /^\s*\n/gmi, '').should.be.equal """
      ### test: Test ###
      should = require 'should'
      describe 'Test', ->
        it 'should be a class', ->
          Test.should.be.a.Function
          Test::constructor.should.be.equal Test
        it 'should be a subclass of A1', -> (Object.create Test::).should.be.an.instanceof A1
        it 'should be a subclass of A2', -> (Object.create Test::).should.be.an.instanceof A2
        it 'should have "sp1" property', -> Test.should.have.property 'sp1'
        it 'should have "sp2" property', -> Test.should.have.property 'sp2'
        it 'should have "sm1()" method', -> Test.sm1.should.be.a.Function---
        it 'should have "sm2()" method', -> Test.sm2.should.be.a.Function---
        describe '#constructor()', ->
          it 'should return an instance of Test', -> (new Test).should.be.an.instanceof Test
        describe 'instance', ->
          it 'should have "p1" property', -> (new Test).should.have.property 'p1'
          it 'should have "p2" property', -> (new Test).should.have.property 'p2'
          it 'should have "m1()" method', -> (new Test).m1.should.be.a.Function
          it 'should have "m2()" method', -> (new Test).m2.should.be.a.Function
          describe '#p1', ->
          describe '#p2', ->
          describe '#m1()', ->
          describe '#m2()', ->

      """
