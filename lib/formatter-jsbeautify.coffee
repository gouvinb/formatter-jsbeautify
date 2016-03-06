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
    js:
      title: 'Javascript'
      type: 'object'
      description: 'All parameters for Javascript.'
      properties:
        enable:
          title: 'Enable formatter for Javascript'
          type: 'boolean'
          default: true
          description: 'Need restart Atom.'
        arguments:
          title: 'Arguments passed to the formatter Javascript'
          type: 'array'
          default: []
          description: 'Example : `[[PRINT EXAMPLE]]`.'
    css:
      title: 'CSS'
      type: 'object'
      description: 'All parameters for CSS.'
      properties:
        enable:
          title: 'Enable formatter for CSS'
          type: 'boolean'
          default: true
          description: 'Need restart Atom.'
        arguments:
          title: 'Arguments passed to the formatter CSS'
          type: 'array'
          default: []
          description: 'Example : `[[PRINT EXAMPLE]]`.'
    less:
      title: 'LESS'
      type: 'object'
      description: 'All parameters for LESS.'
      properties:
        enable:
          title: 'Enable formatter for LESS'
          type: 'boolean'
          default: true
          description: 'Need restart Atom.'
        arguments:
          title: 'Arguments passed to the formatter LESS'
          type: 'array'
          default: []
          description: 'Example : `[[PRINT EXAMPLE]]`.'
    sass:
      title: 'SASS'
      type: 'object'
      description: 'All parameters for SASS.'
      properties:
        enable:
          title: 'Enable formatter for SASS'
          type: 'boolean'
          default: true
          description: 'Need restart Atom.'
        arguments:
          title: 'Arguments passed to the formatter SASS'
          type: 'array'
          default: []
          description: 'Example : `[[PRINT EXAMPLE]]`.'
    html:
      title: 'HTML'
      type: 'object'
      description: 'All parameters for HTML.'
      properties:
        enable:
          title: 'Enable formatter for HTML'
          type: 'boolean'
          default: true
          description: 'Need restart Atom.'
        arguments:
          title: 'Arguments passed to the formatter HTML'
          type: 'array'
          default: []
          description: 'Example : `[[PRINT EXAMPLE]]`.'

  provideFormatter: ->
    [
      {
        selector: '.source.js'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-jsbeautify.a.executablePath'
            args = atom.config.get 'formatter-jsbeautify.js.arguments'
            args.push '--type'
            args.push 'js'
            args.push '-n'
            toReturn = []
            process = child_process.spawn(command, args, {})
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addWarning("An error is occured");
      } if atom.config.get 'formatter-jsbeautify.js.enable'
      {
        selector: '.source.css'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-jsbeautify.a.executablePath'
            args = atom.config.get 'formatter-jsbeautify.css.arguments'
            args.push '--type'
            args.push 'css'
            args.push '-n'
            toReturn = []
            process = child_process.spawn(command, args, {})
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addWarning("An error is occured");
      } if atom.config.get 'formatter-jsbeautify.css.enable'
      {
        selector: '.source.less'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-jsbeautify.a.executablePath'
            args = atom.config.get 'formatter-jsbeautify.less.arguments'
            args.push '--type'
            args.push 'css'
            args.push '-n'
            toReturn = []
            process = child_process.spawn(command, args, {})
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addWarning("An error is occured");
      } if atom.config.get 'formatter-jsbeautify.less.enable'
      {
        selector: '.source.sass'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-jsbeautify.a.executablePath'
            args = atom.config.get 'formatter-jsbeautify.sass.arguments'
            args.push '--type'
            args.push 'css'
            args.push '-n'
            toReturn = []
            process = child_process.spawn(command, args, {})
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addWarning("An error is occured");
      } if atom.config.get 'formatter-jsbeautify.sass.enable'
      {
        selector: '.text.html.basic, text.html.gohtml, text.html.ruby, text.html.mustache, text.html.erb'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-jsbeautify.a.executablePath'
            args = atom.config.get 'formatter-jsbeautify.html.arguments'
            args.push '--type'
            args.push 'html'
            args.push '-n'
            toReturn = []
            process = child_process.spawn(command, args, {})
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addWarning("An error is occured");
      } if atom.config.get 'formatter-jsbeautify.html.enable'
    ]
