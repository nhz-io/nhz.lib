### test: async.parallel(args = {}) ###

should = require 'should'
parallel = require '../../async/parallel'

describe 'parallel(source)', ->
  it 'should be a function', ->
    parallel.should.be.an.instanceof Function

  it 'should return an object with "then" and "timeout" methods', ->
    test = parallel (->), (->)
    test.then.should.be.an.instanceof Function
    test.timeout.should.be.an.instanceof Function

  it 'should accept tasks as arguments list', (done) ->
    parallel ((cb) -> cb null, 1), ((cb) -> cb null, 2), ((cb) -> cb null, 3)
    .then (err, res) ->
      res.length.should.be.equal 3
      done()

  it 'should accept tasks in array passed as first argument', (done) ->
    parallel [ ((cb) -> cb null, 1), ((cb) -> cb null, 2), ((cb) -> cb null, 3) ]
    .then (err, res) ->
      res.length.should.be.equal 3
      done()

  it 'should pass errors to the callback provided with ".then(callback)" in the form of array in first argument', (done) ->
    parallel ((cb) -> cb 1, 1), ((cb) -> cb null, 2), ((cb) -> cb 3, 3)
    .then (err, res) ->
      err.length.should.be.equal 3
      err[0].should.be.equal 1
      should(err[1]).be.equal undefined
      err[2].should.be.equal 3
      done()

  it 'should pass results to the callback provided with ".then(callback)" in the form of array in the second argument', (done) ->
    parallel ((cb) -> cb 1, 1), ((cb) -> cb null, 2), ((cb) -> cb 3, 3)
    .then (err, res) ->
      res.length.should.be.equal 3
      res[0].should.be.equal 1
      res[1].should.be.equal 2
      res[2].should.be.equal 3
      done()

  it 'should honor the timeout provided with ".timeout(value)"', (done) ->
    parallel (cb) -> setTimeout (-> throw new Error "Should not reach here"), 1000
    .timeout 300
    .then (err) ->
      err.message.should.be.equal 'Timeout'
      done()



