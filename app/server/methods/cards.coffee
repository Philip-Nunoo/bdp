# @Tokens = new Meteor.Collection('tokens');
#
# Schemas.Tokens = new SimpleSchema
#   type:
#     type: String
#     allowedValues: ['auto', 'import', 'access']
#     autoform:
#       type: 'select-radio-inline'
#       options: ->
#         Config.tokenTypes
#
#   accessUrl:
#     type: String
#     label: 'Enter data source url'
#     optional: true
#
#   numberOfCards:
#     type: Number
#     label: 'Enter number of cards to auto generate'
#     min: 1
#     optional: true
#
#   obj:
#     type: [String]
#     optional: true
#
#   cardId:
#     type: String
#     optional: true

Meteor.methods
  insertCardCodes: (doc)->
    check(doc, Object)
    check(doc.type, String)
    check(doc.cardId, String)
    check(doc.obj2, Array)

    arr = []
    for i in doc.obj2
      arr.push({code: i, issued: false})
      # body...
    tokens = {
      type: doc.type
      obj: arr
    }
    idSelector = doc.cardId

    # console.log tokens
    Cards.update({_id:idSelector}, {$set:{"tokens": tokens}})

    return doc
