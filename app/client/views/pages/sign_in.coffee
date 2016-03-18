Template.signIn.helpers
  atDisabled: ->
    return AccountsTemplates.disabled()

  atClass: ->
    return AccountsTemplates.disabled() ? 'disabled' : 'active'
