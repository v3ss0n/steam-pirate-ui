module.exports =
    apply : ->
        root = document.documentElement
        mainbg = document.querySelector("body")
        setLayoutMode = (layoutMode) ->
            root.setAttribute('theme-steam-pirate-ui-layoutmode',
            layoutMode.toLowerCase())
        setBlurRadius = (blurRadius) ->
            style = document.createElement('style')
            style.type = 'text/css'
            rule = "body:before{ -webkit-filter: blur( #{blurRadius}px );}"
            document.querySelector('head atom-styles').appendChild(style)
            style.sheet.insertRule(rule,style.sheet.rules.length)

        atom.config.onDidChange 'steam-pirate-ui.layoutMode', ->
            setLayoutMode(atom.config.get('steam-pirate-ui.layoutMode'))
            
        atom.config.onDidChange 'steam-pirate-ui.blurBackground', ->
            setBlurRadius(atom.config.get('steam-pirate-ui.blurBackground'))