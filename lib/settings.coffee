module.exports =
  config:

    fontSize:
      title: 'Font Size'
      description: 'Change the UI font size. Needs to be between 10 and 20.'
      type: ['integer', 'string']
      minimum: 10
      maximum: 20
      default: 'Auto'

    layoutMode:
      title: 'Layout Mode'
      description: 'In Auto mode, the UI will automatically adapt based on the window size.'
      type: 'string'
      default: 'Auto'
      enum: [
        'Compact',
        'Auto',
        'Spacious',
      ]
      
    blurBackground:
      title: 'Blur Background'
      description: 'Blurs the background with given blur Radius, set 0 to disable'
      type: 'string'
      default: "0"
      
    backgroundImage:
      title: 'Background Image'
      description: 'Path to the background image'
      type: 'string'
      default: 'atom://steam-pirate-ui/imgs/hexxed.jpg'

  activate: (state) ->
    atom.themes.onDidChangeActiveThemes ->
      Config = require './config'
      Config.apply()
