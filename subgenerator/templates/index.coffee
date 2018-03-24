Generator = require 'yeoman-generator'
chalk = require 'chalk'
yosay = require 'yosay'

module.exports = class extends Generator
  prompting: ->
    # Have Yeoman greet the user.
    @log yosay "Welcome to the <%- superb %>
      #{chalk.red('<%= generatorName %>')} generator!"

    prompts = [
      {
        type: 'confirm',
        name: 'someAnswer',
        message: 'Would you like to enable this option?',
        default: true
      }
    ]

    # To access props later use @props.someAnswer
    @prompt(prompts).then (@props)=>

  writing: ->
    @fs.copy @templatePath('dummyfile.txt'),
      @destinationPath('dummyfile.txt')

    @fs.copy @templatePath('somefile.coffee'),
      @destinationPath('somefile.coffee')

  install: ->
    @installDependencies()
