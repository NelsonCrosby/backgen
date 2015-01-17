Field = require './Field'

class PasshashField extends Field
    @matches = [
        /^passhash$/
    ]

    constructor: (data) ->
        # Store a SHA-256-encrypted string, with 8-char salt appended
        super "CHAR(#{64+8})"


Field.types.push PasshashField

module.exports = PasshashField
