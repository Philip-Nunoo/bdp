@Schemas = {}

Schemas.OpenForm = new SimpleSchema
  country:
    type: String

  swift:
    type: String

  account_number:
    type: String

Schemas.UserForm = new SimpleSchema
  institution:
    type: String
    label: "Select Institution"
    autoform:
      type: "select"
      options: ->
        return [
          {label: "University Of CapeCoast", value: "ucc"},
          {label: "Valley View University", value: "vvu"}
        ]

  number:
    type: String
    label: "Enter phone number"
    regEx: /(^\+233(\d{9})$)/
