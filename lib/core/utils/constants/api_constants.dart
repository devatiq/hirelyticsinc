class ApiConstants {
  static const String apiBaseUrlWithHttps = 'https://shojag.com';

  // alert api
  static final String incidentListEndPoint = '/api/incident';
  static final String activeAlertListEndPoint = '/api/active-alerts';
  static final String closedAlertListEndPoint = '/api/closed-alerts';
  static final String myAlertListEndPoint = '/api/my-alerts';
  static final String respondedAlertListEndPoint = '/api/responded-alerts';
  static final String allAlertListEndPoint = '/api/all-alerts';
  static final String alertDetailEndPoint = '/api/alert-detail';
  static final String alertAddEndPoint = '/api/alert/create';
  static final String alertDeleteEndPoint = '/api/alert-delete';
  static final String alertStatusUpdateEndPoint = '/api/close-alert';
  static final String alertResponseEndPoint = '/api/alert-response';
  static final String alertResponseDeleteEndPoint = '/api/response-delete';
  static final String updateAlertEndPoint = '/api/update-alert';

  // authentication api
  static final String thanaListEndPoint = '/api/thana';
  static final String loginEndPoint = '/api/login';
  static final String verifyPhoneEndPoint = '/api/verify-phone';
  static final String verifyOtpPoint = '/api/verify-otp';
  static final String registerEndPoint = '/api/register';
  static final String forgotPasswordEmailPhoneEndPoint = '/api/forgot-password';
  static final String forgotPasswordOtpConfirmEndPoint =
      '/api/confirm-reset-otp';
  static final String resetPasswordEndPoint = '/api/reset-password';

  // fnf api
  static final String searchFnfEndPoint = '/api/search-fnf';
  static final String requestFnfEndPoint = '/api/request-fnf';
  static final String acceptFnfEndPoint = '/api/accept-fnf';
  static final String rejectFnfEndPoint = '/api/reject-fnf';
  static final String cancelFnfEndPoint = '/api/cancel-sent-fnf';
  static final String deleteFnfEndPoint = '/api/delete-fnf';
  static final String incomingFnfListFnfEndPoint = '/api/incoming-fnf';
  static final String outgoingFnfListFnfEndPoint = '/api/outgoing-fnf';
  static final String locationShareLimitEndPoint =
      '/api/location-share-status-fnf';
  static final String locationShareRequestEndPoint =
      '/api/location-share-request';
  static final String fnfLocationLabelAddEndPoint = '/api/fnf-location-label-add';
  static final String fnfLocationLabelDeleteEndPoint = '/api/fnf-location-label-delete';

  // profile api
  static final String updateProfileEndPoint = '/api/update-profile';
  static final String updateProfilePicEndPoint = '/api/update-profile-pic';
  static final String updateDeviceTokenEndPoint = '/api/update-device-token';
  static final String updateUserLocationEndPoint = '/api/update-userlocation';
  static final String logoutUserEndPoint = '/api/logout';

  // setting api
  static final String areaLimitUpdateEndPoint = '/api/area-limit';
  static final String updatePasswordEndPoint = '/api/update-password';
  static final String deleteAccountEndPoint = '/api/delete-account';


  // premium api
  static final String premiumCheckEndPoint = '/api/is-premium';

  // feedback api
  static final String feedbackSendEndPoint = '/api/user-review';

  // payment api
  static final String paymentIpnUrl = '$apiBaseUrlWithHttps/api/ipn';
}

