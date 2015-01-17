# Load all field types to register them in Field
require './StringField'
require './OneManyField'
require './PasshashField'

# Return field type (for convenience)
module.exports = require './Field'
