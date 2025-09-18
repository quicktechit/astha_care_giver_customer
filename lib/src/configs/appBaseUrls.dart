class Urls {
  /// base url
  static const domain = "https://asthacare.gariseba.com";
  static const baseUrl = "$domain/api/v1";

  static String getImageURL({required String endPoint}) => '$domain/$endPoint/';

  static String registration = "$baseUrl/customer/register";
  static String login = "$baseUrl/customer/login";
  static String sliders = "$baseUrl/customer/sliders";
  static String otpSubmit = "$baseUrl/customer/login";
  static String offers = "$baseUrl/customer/offers";
  static String verifyOtp = "$baseUrl/customer/verify";
  static String tripReqCancel = "$baseUrl/customer/trip-request-cancel";
  static String tripConfirmCancel = "$baseUrl/customer/trip-confirm-cancel";
  static String returnTripConfirmCancel = "$baseUrl/customer/return-trip-confirm-cancel";
  static String divisionTripConfirmCancel = "$baseUrl/customer/division-trip-confirm-cancel";
  static String drivingTrainingSubmit = "$baseUrl/customer/driver-training-submit";
  static String drivingTrainingList = "$baseUrl/customer/driver-training-list";

  static String profile({required String userToken}) =>
      "$baseUrl/customer/profile?token=$userToken";
  static String editProfile = "$baseUrl/customer/profile-update";
  static String carList = "$baseUrl/customer/category/";
  static String rentalTripHistory = "$baseUrl/customer/return-trip-history";
  static String divisionTripHistory = "$baseUrl/customer/division-trip-history";
  static String tripHistory = "$baseUrl/customer/trip-history";
  static String allSortingTrip = "$baseUrl/customer/all-trip-history";
  static String allConfirmSortingTrip = "$baseUrl/customer/all-confirm-trip-history";
  static String allStartSortingTrip = "$baseUrl/customer/all-start-trip-history";
  static String allCancelSortingTrip = "$baseUrl/customer/all-cancel-trip-history";
  static String allCompleteSortingTrip = "$baseUrl/customer/all-complete-trip-history";
  static String promoCode = "$baseUrl/customer/promos";
  static String returnTripHistory = "$baseUrl/customer/return-trip-status";
  static String rentalTripFormCheckSubmit = "$baseUrl/customer/trip-form-check";
  static String rentalTripSubmit = "$baseUrl/customer/trip-form-submit";

  static String liveBid = "$baseUrl/customer/bid-list";
  static String division = "$baseUrl/customer/divisions";
  static String returnFilter = "$baseUrl/customer/return-trip";
  static String allList = "$baseUrl/customer/return-trip-lists";
  static String returnBidConfirm = "$baseUrl/customer/customer-bid";
  static String returnBidCancel = "$baseUrl/customer/customer-bid-cancel";
  static String historyCancel = "$baseUrl/customer/division-trip-confirm-cancel";
  static String expireTrip = "$baseUrl/customer/trip-expire-submit";
  static String bidConfirm = "$baseUrl/customer/bid-confirm";
  static String guideLine = "$baseUrl/customer/guide";
  static String travel = "$baseUrl/customer/travels";
  static String package = "$baseUrl/customer/our-packages";
  static String driver = "$baseUrl/customer/our-drivers";
  static String offer = "$baseUrl/customer/our-offers";
  static String partnerShip = "$baseUrl/customer/partnerships";
  static String singleReturnTripDetails =
      "$baseUrl/customer/return-single-history";
  static String singleTripDetails = "$baseUrl/customer/single-trip-history";
  static String singleDivisionTripDetails = "$baseUrl/customer/single-division-trip-history";
  static String notificationList = "$baseUrl/customer/notification-history";
  static String cancelReason = "$baseUrl/customer/cancel-reasons";
  static String clearNotification = "$baseUrl/customer/notification-history-clear";
  static String searchList = "https://return.gariseba.com/api/v1/customer/trip-requests/search?search_location=";
  static String notificationListDelete =
      "$baseUrl/customer/notifcation/delete-all";
}
