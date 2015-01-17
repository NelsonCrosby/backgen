Field = require './Field'

class StringField extends Field
    @matches = [
        /^string$/
    ]

    constructor: (data) ->
        @limit = data.limit

        if @limit
            super "VARCHAR(#{@limit})"
        else
            super "TEXT"


Field.types.push StringField

module.exports = StringField
