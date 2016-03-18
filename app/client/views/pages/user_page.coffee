Template.cardsList.helpers
  cards: ->
    Cards.find().fetch()

  offset: (index)->
    (index%4) == 0 || NaN
#
# Template.cardsList.events
#   "click .makePayment": (event, template) ->
#     console.log "trigger modal for payment", @
#     return

Template.buyModal.events
  "click #makePayment": (event, template) ->
    phone = $("#recipient-name").val()
    if phone?
      Meteor.call 'sendSMS', {phone: phone}, (err, resp)->
        if !err
          console.log "Done"
          # close this modal
          $("#numberInputModal").modal('hide')
          $("#verificationInputModal").modal('show')
          # start verification
    return

Template.verifyModal.events
  "click #verifyCode": (event, template) ->
    code = $("#verification-code").val()
    if code?
      $("#verification-code").val("")
      $("#recipient-name").val("")
      Meteor.call 'verifyCode', {smsCode: code}, (err, resp)->
        if !err
          console.log "begin subtract"
          $("#verificationInputModal").modal('hide')
