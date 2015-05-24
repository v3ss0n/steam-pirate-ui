module.exports =
    config :
        layoutMode :
            title : 'Layout Mode'
            description : 'In Auto mode, the UI and font size will automatically change based on the window size.'
            type : 'string'
            default : 'Auto'
            enum : [
                'Compact',
                'Auto',
                'Spacious',
            ]
        blurBackground :
            title : 'Blur Background'
            description : 'Blurs the background with given blur Radius, set 0 to disable'
            type : 'string'
            default : "0"
        backgroundImage :
            title : 'Background Image'
            description : 'Path to the background image'
            type : 'string'
            default : 'atom://steam-pirate-ui/imgs/hexxed.jpg'

    activate : (state) ->
        atom.themes.onDidChangeActiveThemes ->
            Config = require './config'
            Config.apply()
