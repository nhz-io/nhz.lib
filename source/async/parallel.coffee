### async.parallel(args = {}) ###

module.exports = (tasks...) ->
  if tasks[0] instanceof Array then tasks = tasks[0]
  errors = []
  results = []
  timeout = 5000
  timeoutId = null
  done = false
  started = false
  count = tasks.length

  finish = ->
    done = true
    clearTimeout timeoutId

  start = (callback) ->
    reset = ->
      finish()
      callback (new Error "Timeout"), results

    timeoutId = setTimeout reset, timeout
    started = true
    for task, id in tasks then do (id) -> task (err, res) ->
      unless done
        count--
        if err then errors[id] = err
        if res then results[id] = res

        if count < 1
          if errors.length is 0 then errors = null
          finish()
          callback errors, results

    return timeoutId

  result =
    timeout: (value) ->
      timeout = value
      return result

    then: (callback) ->
      unless started then start callback

  return result
