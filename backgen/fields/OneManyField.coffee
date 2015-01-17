Field = require './Field'

class OneManyField extends Field
    @matches = [
        /^list:(.+)$/
    ]

    constructor: (data, regexResult) ->
        super(null)
        @manyModel = regexResult[1]


Field.types.push OneManyField

module.exports = OneManyField
