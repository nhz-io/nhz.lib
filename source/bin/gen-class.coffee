genClass = require '../coffee/gen-class'
module.exports = (argv) ->
  args = argv.slice 2
  ancestors = []
  staticProperties = []
  staticMethods = []
  properties = []
  methods = []
  target = null

  name = args.shift()?.replace /\s/g, ''
  if not name or name.match /(^[^a-z_])|[^0-9a-z_\-]+/i
    throw new Error "Invalid class name: #{name}"

  for arg in args
    switch arg
      when '-a' then target = ancestors
      when '-p' then target = properties
      when '-m' then target = methods
      when '-P' then target = staticProperties
      when '-sp' then target = staticProperties
      when '-M' then target = staticMethods
      when '-sm' then target = staticMethods
      else
        unless target
          throw new Error 'Dont know where #{arg} belongs. Use one of the: -a, -p, -m, -P or -M'
        target.push arg

  console.log genClass
    name:name, ancestors:ancestors
    staticProperties:staticProperties, staticMethods:staticMethods
    properties:properties, methods:methods


