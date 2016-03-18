Template.cardsList.helpers
  cards: ->
    Cards.find().fetch()

  offset: (index)->
    (index%4) == 0 || NaN


Template.cardsList.events
  "click .makePayment": (event, template) ->
    console.log "trigger modal for payment", @
    return
