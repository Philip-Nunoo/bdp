globalHooks =
  onError: (operation, error, template) ->
    Bert.alert (
      title: 'Form submission error',
      type: 'danger',
      message: error.reason || error.message
    );
    return

updateTokenHook =
  onSubmit: (insertDoc, updateDoc, currentDoc)->
    type = insertDoc.type
    form = @

    callback = (error, response) ->
      if error
        form.done(new Error("Submission failed"))
      else
        form.done()

    if type == 'auto' # insert autocodes
      Meteor.call 'insertAutoCodes', insertDoc, callback
      false
    else if type == 'import' ## if csv import
      Meteor.call 'insertCardCodes', insertDoc, callback
      false
    else if type == 'access'
      @done()
      false


    return false

AutoForm.addHooks(null, globalHooks);
AutoForm.addHooks("updateToken", updateTokenHook);

AutoForm.hooks
  "insertNewUser":
    onSubmit: (insertDoc, updateDoc, currentDoc) ->
      form = @
      Meteor.call 'findCard', insertDoc, (error, resp)->
        if error
          form.done(new Error("Submission failed"))
        else
          form.done()
      return false

  "createNewCard":
    onSuccess: (formType, result) ->
      Bert.alert(
        title: 'Card Created'
        type: 'success'

      );
