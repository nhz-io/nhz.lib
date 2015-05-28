### coffee.genClassTests(args) ###

module.exports = (args = {}) ->
  {name, ancestors, staticProperties, properties, staticMethods, methods} = args
  result = ''
  if name
    result += """
      ### test: #{name} ###

      should = require 'should'

      describe '#{name}', ->
        it 'should be a class', ->
          #{name}.should.be.a.Function
          #{name}::constructor.should.be.equal #{name}

    """

    for ancestor in ancestors or [] then result += """
      ---
        it 'should be a subclass of #{ancestor}', -> (Object.create #{name}::).should.be.an.instanceof #{ancestor}

    """

    for property in staticProperties or [] then result += """
      ---
        it 'should have "#{property}" property', -> #{name}.should.have.property '#{property}'

    """

    for method in staticMethods or [] then result += """
      ---
        it 'should have "#{method}()" method', -> #{name}.#{method}.should.be.a.Function
    """

    result += """
      ---
        describe '#constructor()', ->
          it 'should return an instance of #{name}', -> (new #{name}).should.be.an.instanceof #{name}

        describe 'instance', ->

    """

    for property in properties or [] then result += """
      ---
          it 'should have "#{property}" property', -> (new #{name}).should.have.property '#{property}'

    """

    for method in methods or [] then result += """
      ---
          it 'should have "#{method}()" method', -> (new #{name}).#{method}.should.be.a.Function

    """

    for property in properties or [] then result += """
      ---
          describe '##{property}', ->

    """

    for method in methods or [] then result += """
      ---
          describe '##{method}()', ->
            it 'should be a stub', -> (-> (new #{name}).#{method}()).should.throw 'UNIMPLEMENTED'

    """

  return result.replace /^---\s*$/gmi, ''
