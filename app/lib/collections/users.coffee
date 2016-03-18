Schemas.User = new SimpleSchema
  emails:
    type: [Object]
    optional: true

  "emails.$.address":
    type: String
    regEx: SimpleSchema.RegEx.Email
    label: -> TAPi18n.__ 'email'

  "emails.$.verified":
    type: Boolean
    label: -> TAPi18n.__ 'userEmailVerified'

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
