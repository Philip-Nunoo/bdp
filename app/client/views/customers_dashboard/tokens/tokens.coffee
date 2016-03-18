Template.tokensSetupForm.onCreated ->
  Template.instance().uploading = new ReactiveVar( false )
  Template.instance().codes = new ReactiveVar()
  return

Template.tokensSetupForm.helpers
  uploading: ->
    return Template.instance().uploading.get()

  codes: ->
    return Template.instance().codes.get()


Template.tokensSetupForm.events
  'change [name="uploadCSV"]': (event, template) ->
    template.uploading.set( true );

    Papa.parse( event.target.files[0], {
      header: true,
      complete: ( results, file )->
        # Handle the upload here
        Meteor.call( 'parseUpload', results.data, ( error, response )->
          template.uploading.set( false );
          if error
            Bert.alert( error.reason, 'warning' );

          else
            # Handle success here.
            template.codes.set( response );
            Bert.alert( 'Upload complete!', 'success', 'growl-top-right' );
        );
    });
    return
