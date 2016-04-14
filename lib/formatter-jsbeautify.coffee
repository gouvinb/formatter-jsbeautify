{CompositeDisposable} = require 'atom'

module.exports = FormatterJsbeautify =
  activate: (state) ->
    return

  config:
    a:
      title: 'Path to the exectuable'
      type: 'object'
      properties:
        nodePath:
          title: 'Full path of exectuable node'
          type: 'string'
          default: 'node'
        executablePath:
          title: 'Full path of exectuable js-beautify'
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
          description: 'Example : `-s, 3, -w, 80`.'
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
          description: 'Example : `-config=/usr/local/mycfg/css/.jsbeautifyrc`.'
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
          description:
            'Example : `-config=/usr/local/mycfg/less/.jsbeautifyrc`.'
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
          description: 'Example : `-config=/usr/local/mycfg/css/.jsbeautifyrc`.'
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
          description: 'Example : `-s, 8, -w, 160`.'

  provideFormatter: ->
    [
      {
        selector: '.source.js'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-jsbeautify.a.nodePath'
            args = []
            args.push atom.config.get 'formatter-jsbeautify.a.executablePath'
            args.push.apply(args,
              atom.config.get 'formatter-jsbeautify.js.arguments')
            args.push '--type'
            args.push 'js'
            args.push '-n'
            console.log args
            toReturn = []
            toReturnErr = []
            process = child_process.spawn(command, args, {})
            process.stderr.on 'data', (data) -> toReturnErr.push data
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addError('formatter-jsbeautify : error',
                  {dismissable: true, detail: toReturnErr.join('\n')})
      } if atom.config.get 'formatter-jsbeautify.js.enable'
      {
        selector: '.source.css'
        getNewText: (text) ->
          child_process = require 'child_process'
          if atom.workspace.getActiveTextEditor().getGrammar().scopeName in
              ['source.css.less']
            if atom.config.get 'formatter-jsbeautify.less.enable'
              return new Promise (resolve, reject) ->
                command = atom.config.get 'formatter-jsbeautify.a.nodePath'
                args = []
                args.push(
                  atom.config.get 'formatter-jsbeautify.a.executablePath')
                args.push.apply(args,
                  atom.config.get 'formatter-jsbeautify.less.arguments')
                args.push '--type'
                args.push 'css'
                args.push '-n'
                console.log args
                toReturn = []
                toReturnErr = []
                process = child_process.spawn(command, args, {})
                process.stderr.on 'data', (data) -> toReturnErr.push data
                process.stdout.on 'data', (data) -> toReturn.push data
                process.stdin.write text
                process.stdin.end()
                process.on 'close', ->
                  if toReturn.length isnt 0
                    resolve(toReturn.join('\n'))
                  else
                    atom.notifications.addError('formatter-jsbeautify : error',
                      {dismissable: true, detail: toReturnErr.join('\n')})
          else if atom.workspace.getActiveTextEditor().getGrammar().scopeName in
              ['source.sass', 'source.css.scss']
            if atom.config.get 'formatter-jsbeautify.sass.enable'
              return new Promise (resolve, reject) ->
                command = atom.config.get 'formatter-jsbeautify.a.nodePath'
                args = []
                args.push(
                  atom.config.get 'formatter-jsbeautify.a.executablePath')
                args.push.apply(args,
                  atom.config.get 'formatter-jsbeautify.sass.arguments')
                args.push '--type'
                args.push 'css'
                args.push '-n'
                console.log args
                toReturn = []
                toReturnErr = []
                process = child_process.spawn(command, args, {})
                process.stderr.on 'data', (data) -> toReturnErr.push data
                process.stdout.on 'data', (data) -> toReturn.push data
                process.stdin.write text
                process.stdin.end()
                process.on 'close', ->
                  if toReturn.length isnt 0
                    resolve(toReturn.join('\n'))
                  else
                    atom.notifications.addError('formatter-jsbeautify : error',
                      {dismissable: true, detail: toReturnErr.join('\n')})
          else
            if atom.config.get 'formatter-jsbeautify.css.enable'
              return new Promise (resolve, reject) ->
                command = atom.config.get 'formatter-jsbeautify.a.nodePath'
                args = []
                args.push(
                  atom.config.get 'formatter-jsbeautify.a.executablePath')
                args.push.apply(args,
                  atom.config.get 'formatter-jsbeautify.css.arguments')
                args.push '--type'
                args.push 'css'
                args.push '-n'
                console.log args
                toReturn = []
                toReturnErr = []
                process = child_process.spawn(command, args, {})
                process.stderr.on 'data', (data) -> toReturnErr.push data
                process.stdout.on 'data', (data) -> toReturn.push data
                process.stdin.write text
                process.stdin.end()
                process.on 'close', ->
                  if toReturn.length isnt 0
                    resolve(toReturn.join('\n'))
                  else
                    atom.notifications.addError('formatter-jsbeautify : error',
                      {dismissable: true, detail: toReturnErr.join('\n')})
      } if (atom.config.get 'formatter-jsbeautify.css.enable') or
        (atom.config.get 'formatter-jsbeautify.less.enable') or
        (atom.config.get 'formatter-jsbeautify.sass.enable')
      {
        selector: '.text.html'
        getNewText: (text) ->
          child_process = require 'child_process'
          return new Promise (resolve, reject) ->
            command = atom.config.get 'formatter-jsbeautify.a.nodePath'
            args = []
            args.push atom.config.get 'formatter-jsbeautify.a.executablePath'
            args.push.apply(args,
              atom.config.get 'formatter-jsbeautify.html.arguments')
            args.push '--type'
            args.push 'html'
            args.push '-n'
            console.log args
            toReturn = []
            toReturnErr = []
            process = child_process.spawn(command, args, {})
            process.stderr.on 'data', (data) -> toReturnErr.push data
            process.stdout.on 'data', (data) -> toReturn.push data
            process.stdin.write text
            process.stdin.end()
            process.on 'close', ->
              if toReturn.length isnt 0
                resolve(toReturn.join('\n'))
              else
                atom.notifications.addError('formatter-jsbeautify : error',
                  {dismissable: true, detail: toReturnErr.join('\n')})
      } if atom.config.get 'formatter-jsbeautify.html.enable'
    ]
