str = require 'mout/string'


module.exports = () ->
    @loadNpmTasks('grunt-contrib-coffee')
    @loadNpmTasks('grunt-contrib-watch')

    # Load files list
    files =
        coffee: []

    @file.recurse '.', (abspath, rootdir, subdir, filename) ->
        # Ignore gruntfiles
        if str.startsWith filename, 'Gruntfile'
            return

        # Check against all registered extensions
        for ext in Object.getOwnPropertyNames files
            if str.endsWith filename, ".#{ext}"
                # Is of this extension; load into list
                files[ext].push abspath

    # Define config
    config =
        coffee:
            all:
                options:
                    sourceMap: true
                files: {}
        watch:
            coffee:
                files: ['**/*.coffee']
                tasks: ['coffee:all']

    # Load coffeescript files into config
    for item in files.coffee
        itemStrip = item.substr 0, item.lastIndexOf '.'
        config.coffee.all.files["#{itemStrip}.js"] = item

    @initConfig config

