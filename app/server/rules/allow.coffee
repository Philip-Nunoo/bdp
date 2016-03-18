Cards.allow
  insert:  (userId, doc) ->
    userId == doc.owner

  update: (userId, doc, fieldNames, modifier) ->
    userId == doc.owner

  remove: (userId, doc) ->
    userId == doc.owner
    true
