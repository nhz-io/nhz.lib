### coffee.genClass(args) ###

module.exports = (args = {}) ->
  {name, ancestors, staticProperties, properties, staticMethods, methods} = args
  result = ''
  switch ancestors?.length or 0
    when 0 then ancestors = ''
    when 1 then ancestors = ancestors[0]
    else ancestors = "[ #{ancestors.join ', '} ]"

  result += """
    ### #{name} ###

  """

  if ancestors then result += """
    module.exports = class #{name} extends #{ancestors}

  """
  else result += """
    module.exports = class #{name}

  """

  if staticProperties?.length
    result += """
    ---
      Object.defineProperties #{name},

    """
    for property in staticProperties
      result += """
    ---
        #{property}: configurable:yes, enumerable:yes, writable:yes, value:null, get: (->), set: (->)

    """

  if staticMethods?.length
    for method in staticMethods
      result += """
    ---
      @#{method} = -> throw new Error 'UNIMPLEMENTED'

    """

  result += """
    ---
      constructor: ->

  """

  if properties?.length
    result += """
    ---
        Object.defineProperties this,

    """
    for property in properties
      result += """
    ---
          #{property}: configurable:yes, enumerable:yes, writable:yes, value:null, get: (->), set: (->)

    """

  if methods?.length
    for method in methods
      result += """
    ---
      #{method}: -> throw new Error 'UNIMPLEMENTED'

    """

  return result.replace /^---\s*$/gmi, ''
