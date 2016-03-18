@Cards = new Meteor.Collection('cards');

Schemas.Cards = new SimpleSchema
  name:
    type: String
    label: 'Name of card'
    max: 200

  price:
    type: Number
    label: 'Card Amount'

  shortDesc:
    type: String
    label: 'Short Description'
    max: 1000

  longDesc:
    type: String
    label: 'Long Description'
    max: 2500
    autoform:
      afFieldInput:
        type: 'summernote'
        rows: 15

  url:
    type: String
    label: 'Link for usage'
    optional: true
    autoform:
      afFieldInput:
        type: 'url'

  activationDate:
    type: Date
    label: 'Date of activation'

  endDate:
    type: Date
    label: 'End of use'

  owner:
    type: String
    regEx: SimpleSchema.RegEx.Id
    autoValue: ->
      if this.isInsert
        Meteor.userId()
    autoform:
      type: "select"
      options: ->
        _.map Meteor.users.find().fetch(), (user)->
          label: user.emails[0].address
          value: user._id

  tokens:
    type: Schemas.Tokens
    optional: true
    blackbox: true

  createdAt:
    type: Date
    autoValue: ->
      if this.isInsert
        new Date()

  updatedAt:
    type: Date
    optional:true
    autoValue: ->
      if this.isUpdate
        new Date()

  # dataSource:
  #   type: [Object]
  #   blackbox: true

Cards.attachSchema([Schemas.Cards])

Cards.helpers
  qty: ->
    0
  active: ->
    return

  hasTokens: ->
    return @tokens?.obj?.length > 0

  numberOfTokens: ->
    return @tokens?.obj?.length || 0
