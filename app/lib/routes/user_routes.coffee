@CustomerController = RouteController.extend
  layoutTemplate: 'customerLayout'
  loadingTemplate: "loading"
  onBeforeAction: ->
    unless Meteor.user()
      @redirect '/sign_in'
    else
      # if Meteor.user().isAdmin() or Meteor.user().isCustomer()
      #   user = Meteor.user()
      #   userWarnings(user)
      #   @next()
      # else
        # @redirect 'dashboard'
      @next()

Router.map ->
  @route "dashboard",
    path: "/customer"
    controller: 'CustomerController'
    data: ->
      # query = @params.query
      # # if query.toast == "job_created"
      #   # sAlert.success "Job created successfully"
      # jobs: Jobs.find()
      # upcoming: Jobs.find start: $gt: new Date()
      return
    onAfterAction: ->
      # Session.set 'title', TAPi18n.__ 'titleCustomerDashboard'
      return

  @route "newCard",
    path: "/customer/card"
    controller: 'CustomerController'
    data: ->
      # query = @params.query
      # # if query.toast == "job_created"
      #   # sAlert.success "Job created successfully"
      # jobs: Jobs.find()
      # upcoming: Jobs.find start: $gt: new Date()
      return
    onAfterAction: ->
      # Session.set 'title', TAPi18n.__ 'titleCustomerDashboard'
      return

  @route "editCard",
    path: "/customer/card/:_id"
    controller: 'CustomerController'
    data: ->
      card: Cards.findOne _id: @params._id
