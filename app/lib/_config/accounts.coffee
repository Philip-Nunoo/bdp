myLogoutFunc = ()->
  return

myLogoutFunc = ()->
  return

mySubmitFunc = ()->
  return

myPreSubmitFunc = ()->
  return

myPostSubmitFunc = ()->
  return

AccountsTemplates.configure({
    # Behavior
    confirmPassword: true,
    enablePasswordChange: true,
    forbidClientAccountCreation: false,
    overrideLoginErrors: true,
    sendVerificationEmail: false,
    lowercaseUsername: false,
    focusFirstInput: true,

    # Appearance
    showAddRemoveServices: false,
    showForgotPasswordLink: false,
    showLabels: true,
    showPlaceholders: true,
    showResendVerificationEmailLink: false,

    # Client-side Validation
    continuousValidation: false,
    negativeFeedback: false,
    negativeValidation: true,
    positiveValidation: true,
    positiveFeedback: true,
    showValidating: true,

    # Privacy Policy and Terms of Use
    privacyUrl: 'privacy',
    termsUrl: 'terms-of-use',

    # Redirects
    homeRoutePath: '/',
    redirectTimeout: 4000,

    # Hooks
    onLogoutHook: myLogoutFunc,
    onSubmitHook: mySubmitFunc,
    preSignUpHook: myPreSubmitFunc,
    postSignUpHook: myPostSubmitFunc,

    # Texts
    texts: {
      button: {
          signUp: "Sign up"
      },
      socialSignUp: "Register",
      socialIcons: {
          "meteor-developer": "fa fa-rocket"
      },
      title: {
          forgotPwd: "Recover Your Password"
      },
    },
});

AccountsTemplates.addField({
    _id: 'name',
    type: 'text',
    displayName: "Institution name",
    required: true,
    minLength: 10
    placeholder: {
        signUp: "Name of Institution"
    }
    errStr: 'Enter valid Institution!',
});
