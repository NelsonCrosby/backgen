Field = require './fields/Field'

class Model
    constructor: (data) ->
        @info = data._info
        delete data._info
        
        @fields = {}
        for fieldName in Object.getOwnPropertyNames data
            @fields[fieldName] = Field.create data[fieldName]


module.exports = Model
