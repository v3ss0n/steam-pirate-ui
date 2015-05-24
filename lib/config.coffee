style = document.createElement 'style'
blurRadiusRule = null
bgImageRule = null
module.exports =
    apply : ->
        root = document.documentElement
        style.type = 'text/css'
        document.querySelector('head atom-styles').appendChild(style)

        setLayoutMode = (layoutMode) ->
            root.setAttribute('theme-steam-pirate-ui-layoutmode',
            layoutMode.toLowerCase())

        setBlurRadius = (blurRadius) ->
            rule = "body:before{ -webkit-filter: blur( #{blurRadius}px );}"
            if blurRadiusRule != null
              style.sheet.deleteRule(blurRadiusRule)
            else
              blurRadiusRule = style.sheet.rules.length
            style.sheet.insertRule(rule, blurRadiusRule)

        setBackgroundImage = (backgroundImage) ->
            rule = "body:before{ background-image: url( #{backgroundImage} );}"
            if bgImageRule != null
              style.sheet.deleteRule(bgImageRule)
            else
              bgImageRule = style.sheet.rules.length
            style.sheet.insertRule(rule, bgImageRule)

        setLayoutMode(atom.config.get('steam-pirate-ui.layoutMode'))
        setBlurRadius(atom.config.get('steam-pirate-ui.blurBackground'))
        setBackgroundImage(atom.config.get('steam-pirate-ui.backgroundImage'))

        atom.config.onDidChange 'steam-pirate-ui.layoutMode', ->
            setLayoutMode(atom.config.get('steam-pirate-ui.layoutMode'))

        atom.config.onDidChange 'steam-pirate-ui.blurBackground', ->
            setBlurRadius(atom.config.get('steam-pirate-ui.blurBackground'))

        atom.config.onDidChange 'steam-pirate-ui.backgroundImage', ->
            setBackgroundImage(atom.config.get('steam-pirate-ui.backgroundImage'))
            
    deactivate : (state) ->
        document.querySelector('head atom-styles').removeChild style
