Meteor.methods
  findCard: (doc) ->
    console.log doc
    return throw new Meteor.Error 500, "Server response error", "Server response error!"
    # return doc

  parseUpload: (datum)->
    check(datum, Array)

    returnArray = []
    for data in datum
      if data.alpha?
        returnArray.push data.alpha

    return returnArray
# Meteor.methods({
#   parseUpload( data ) {
#     check( data, Array );
#
#     for ( let i = 0; i < data.length; i++ ) {
#       let item   = data[ i ],
#           exists = Sales.findOne( { saleId: item.saleId } );
#
#       if ( !exists ) {
#         Sales.insert( item );
#       } else {
#         console.warn( 'Rejected. This item already exists.' );
#       }
#     }
#   }
# });
