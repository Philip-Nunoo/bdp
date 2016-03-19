@Tokens = new Meteor.Collection('tokens');

Schemas.Tokens = new SimpleSchema
  type:
    type: String
    allowedValues: ['auto', 'import', 'access']
    autoform:
      type: 'select-radio-inline'
      options: ->
        Config.tokenTypes

  accessUrl:
    type: String
    label: 'Enter data source url'
    optional: true

  numberOfCards:
    type: Number
    label: 'Enter number of cards to auto generate'
    min: 1
    optional: true

  obj:
    type: [Object]
    optional: true
    blackbox: true

  obj2:
    type: [String]
    optional: true
    
  cardId:
    type: String
    optional: true
