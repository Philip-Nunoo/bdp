Router.map ->
  @route "home",
    path: "/"
    template: 'generationPage'
    layoutTemplate: "homeLayout"
    # fastRender: true
    onBeforeAction: ->
      if Meteor.user()? # .isCustomer()
        @redirect 'dashboard'
      else
        @next()

  @route "about",
    path: "/about"
    template: 'about'
    layoutTemplate: "homeLayout"
    # fastRender: true
    onBeforeAction: ->
      if Meteor.user()? #?.isCustomer()
        @redirect 'dashboard'
      else
        @next()

  @route "signIn",
    path: "/sign_in"
    layoutTemplate: "homeLayout"
    # fastRender: true
    onBeforeAction: ->
      if Meteor.user()?.isCustomer() or Meteor.user()?.isGuard()
        @redirect 'dashboard'
      else
        @next()
