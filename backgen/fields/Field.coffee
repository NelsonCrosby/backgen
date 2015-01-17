class Field
    @types = []
    
    @create: (typeInfo) ->
        for type in @types
            for regex in type.matches
                regexResult = regex.exec typeInfo.type
                if regexResult
                    return new type typeInfo, regexResult
    
    constructor: (sqlType) ->
        @sqlType = sqlType


module.exports = Field
