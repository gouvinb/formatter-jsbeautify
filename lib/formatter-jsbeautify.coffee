{CompositeDisposable} = require 'atom'

module.exports = FormatterJsbeautify =
  activate: (state) ->
    return

  config:
    a:
      title: 'Path to the exectuable'
      type: 'object'
      properties:
        executablePath:
          title: 'Full path of exectuable'
          type: 'string'
          default: 'js-beautify'
    css:
      title: 'CSS'
      type: 'object'
      description: 'All parameters for CSS.'
      properties:
        enable:
          title: 'Enable formatter for CSS'
          type: 'boolean'
          default: true
        arguments:
          title: 'Arguments passed to the formatter CSS'
          type: 'array'
          default: []
          description: 'Example : `[[PRINT EXAMPLE]]`.'
    argumentsCss:
      title: 'Arguments passed to the formatter css language'
      type: 'array'
      default: []
      description: 'Example : '
    argumentsLess:
      title: 'Arguments passed to the formatter less language'
      type: 'array'
      default: []
      description: 'Example : '
    argumentsSass:
      title: 'Arguments passed to the formatter Sass language'
      type: 'array'
      default: []
      description: 'Example : '

  provideFormatter: ->
    [
      {
        selector: '.source.css'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-jsbeautify.executablePath'
            args = atom.config.get 'formatter-jsbeautify.argumentsCss'
            args.push '--type'
            args.push 'css'
            args.push '-n'
            toReturn = []
            process = child_process.spawn(command, args, {})
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              resolve(toReturn.join('\n'))
      }
      {
        selector: '.source.less'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-jsbeautify.executablePath'
            args = atom.config.get 'formatter-jsbeautify.argumentsLess'
            args.push '--type'
            args.push 'css'
            args.push '-n'
            toReturn = []
            process = child_process.spawn(command, args, {})
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              resolve(toReturn.join('\n'))
      }
      {
        selector: '.source.sass'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-jsbeautify.executablePath'
            args = atom.config.get 'formatter-jsbeautify.argumentsSass'
            args.push '--type'
            args.push 'css'
            args.push '-n'
            toReturn = []
            process = child_process.spawn(command, args, {})
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              resolve(toReturn.join('\n'))
      }
    ]
