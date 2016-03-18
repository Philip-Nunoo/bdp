Future = Npm.require('fibers/future')

future = new Future()
# http://testpay.vodafonecash.com.gh/SendSMS.php
####################
# vendor =
# amount =
# phone = 233xxxxxxxxx

# http://testpay.vodafonecash.com.gh/SMSValidation.php
# ##################
# smsCode
# vfPIN maxLength: 4
# merchantCode=711500

# http://testpay.vodafonecash.com.gh/CompleteTransaction.php
# ###################
# vfPIN = '4567'
# amount
# smsCode
# merchantCode

asyncCallback = (error ,result)->
  if !error
    # console.log result.content
    json = result.content
    # console.log json
    return future.return result.content
  else
    return future.throw new Meteor.Error 404, error, error

Meteor.methods
  # http://testpay.vodafonecash.com.gh/SMSValidation.php
  # ##################
  # smsCode
  # vfPIN maxLength: 4
  # merchantCode=711500
  verifyCode: (doc)->
    check(doc, Object)
    check(doc.smsCode, String)

    options = {
      smsCode: doc.smsCode  # is not necessary
      vfPIN: "4567"         # vfPIN is not necessary
    }

    future = new Future()
    url = Config.vodafoneApiUrl

    HTTP.post("#{url}/SMSValidation.php", {params: options}, (error, result)->
      if !error
        # Fuck this part doesn't do anything
        # Send completeTransaction
        ###
        phone: $('#phone').val(),
        vfPIN: $('#vfPIN').val(),
        amount: $('#amount').val(),
        smsCode: $('#smsCode').val(),
        merchantCode: $('#merchantCode').val()
        ###
        # Meteor.call 'completeTransaction',
        return future.return result.content
      else
        return future.throw new Meteor.Error 404, error, error
    )
    future.wait()
    return

  # http://testpay.vodafonecash.com.gh/SendSMS.php
  ####################
  # vendor = "BDP"
  # amount =
  # phone = 233xxxxxxxxx
  sendSMS: (doc) ->

    future = new Future()
    url = Config.vodafoneApiUrl

    options = {
      vendor: 'BDP', # this field is corrupted
      amount: 1,     # this field is corrupted
      phone: '233206242008'
    }

    HTTP.post("#{url}/SendSMS.php", {params: options}, asyncCallback)
    future.wait()
    return

  # http://testpay.vodafonecash.com.gh/CompleteTransaction.php
  # ###################
  # phone = "233206242008"
  # vfPIN = '4567'
  # amount
  # smsCode
  # merchantCode = 511506
  completeTransaction: (doc)->

    url = Config.vodafoneApiUrl

    options = {
      vfPIN: '4567',
      amount: 1,
      smsCode: '691428'
      merchantCode: '511506'
      phone: "233206242008"
    }

    HTTP.post("#{url}/CompleteTransaction.php", {params: options}, asyncCallback)
    future.wait()
    return

  sendApiRequest: (doc)->
    merchantUserName = "511506"
    merchantPassword = "hackathon2"
    token = "abc1234"
    amount = "1"

    url = Config.vodafoneApiUrl
    options = {
      username: merchantUserName,
      password: merchantPassword,
      token: token,
      amount: doc.amount
    }

    HTTP.post(url, {
      params: {
        username: merchantUserName,
        password: merchantPassword,
        token: token,
        amount: doc.amount
      }
    }, asyncCallback);

    future.wait()
    return

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
