Router.map ->
  @route "home",
    path: "/"
    template: 'home'
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

  @route "search",
    path: "/search"
    template: 'search'
    layoutTemplate: "homeLayout"
    # fastRender: true
    onBeforeAction: ->
      if Meteor.user()? #?.isCustomer()
        @redirect 'dashboard'
      else
        @next()

  @route "signIn",
    path: "/sign-in"
    layoutTemplate: "homeLayout"
    # fastRender: true
    onBeforeAction: ->
      if Meteor.user()?.isCustomer() or Meteor.user()?.isGuard()
        @redirect 'dashboard'
      else
        @next()

  @route "signUp",
    path: "/register"
    layoutTemplate: "homeLayout"
    # fastRender: true
    onBeforeAction: ->
      if Meteor.user()?.isCustomer() or Meteor.user()?.isGuard()
        @redirect 'dashboard'
      else
        @next()
