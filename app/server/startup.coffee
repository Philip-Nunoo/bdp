Meteor.startup ->
  return
  # if Cards.find().count() < 6
  #   _.each(_.range(6), (i)->
  #     cardName = Config.fakeSchools[i]
  #     quantity =  Math.floor(Math.random() * (999 - 99 + 1)) + 99;
  #     description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
  #
  #     doc = {
  #       cardName: cardName,
  #       qty: quantity,
  #       desc: description
  #     }
  #
  #     Cards.insert doc
  #
  #   );
