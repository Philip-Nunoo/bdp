Schemas.User = new SimpleSchema
  emails:
    type: [Object]
    optional: true

  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email
    label: -> 'email'

  "emails.$.verified":
    type: Boolean
    label: -> 'userEmail'

  services:
    type: Object
    optional: true
    blackbox: true

  roles:
    type: [String]
    blackbox: true
    optional: true

  createdAt:
    type: Date

Meteor.users.attachSchema Schemas.User

Meteor.users.helpers
  isCustomer: ->
    true
