fs = require 'fs'
path = require 'path'

module.exports = (rootdir) ->
    apidir = path.join rootdir, 'api'
    
    models = {}
    
    files = fs.readdirSync apidir

    for modelFileName in files
        modelPath = path.join apidir, modelFileName

        modelName = path.basename modelPath
        modelName = modelName.substr 0, modelName.lastIndexOf '.'

        data = fs.readFileSync modelPath
        modelData = JSON.parse data
        modelData._info.path = modelPath
        models[modelName] = modelData

    return models
