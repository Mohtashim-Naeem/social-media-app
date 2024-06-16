class ApiEndPoints {
  static AuthEndPoints authEndPoints = AuthEndPoints();
  static ProfileEndPoints profileEndPoints = ProfileEndPoints();
  static HomeEndPoints homeEndPoints = HomeEndPoints();
  static const String paymentIntent = '/v1/payment_intents/';
  static const String verifyUserPurchase = '/verifyUserPurchase';

  static const String createStripeClientSecrets =
      '/CreateStripeClientSecretController';
}

class AuthEndPoints {
  final String registerEmail = 'auth/register';
  final String loginEmail = 'auth/login';
  final String verifyOtp = 'auth/verifyOtp';
  final String forgotPassword = 'auth/forgotPassword';
  final String resetPassword = 'auth/resetPassword';
  final String createPassword = 'auth/createPassword';
  final String resendOtp = 'auth/resendOtp';
  final String postUidSocialLogin = "auth/SocialLogin";
  final String postUidsocialSignUp = "auth/SocialRegister";
  final String authVerify = "validateToken";

  final String wishList = 'allWishlist';
}

class ProfileEndPoints {
  final String getProfile = 'auth/profile';
  final String updateProfile = 'auth/updateprofile';
  final String deleteAccount = 'auth/delete';
  final String changePassword = 'auth/changePassword';
}

class HomeEndPoints {
  final String homeCategorie = 'categoriesByUserId';
  final String subCategorie = 'GetAllSubcategories';
  final String attraction = 'SubCategoryById';
  final String addReview = 'addCategoryReview';
  final String getAllReviewsByCategoryId = 'getAllReviewsByCategoryId';
  final String getMyReviews = 'getMyreviews';
  final String addOrRemoveToFav = 'addOrRemoveToWishlist';
  final String getWishlist = 'allWishlistByUser';
  final String deleteReview = 'deleteReview';
  final String updateMyReview = 'updateReview';
  final String userProfileHistory = 'getUserPurchasesByUserId';
  final String getAllCategoriesByAsc = 'GetAllCategoriesByAsc';
  final String getAllMostPopCat = 'GetMostPopulerCategories';
  final String getAllSubCategoriesByAsc = 'GetAllSubCategoriesByAsc';
  final String postDeviceToken = 'deviceToken';
  final String updateNotifications = 'updateNotifications';
  final String getNotificationSetting = 'getNotificationSetting';
  final String nearbyData = 'nearBy';
  final String nearbyFilterData = 'nearByFilter';
  final String categorieReviewBar = 'getReviewsDataByCategoryId';
  final String getAllSubcategoryLabels = "getAllSubcategoryLabels";
  final String updateIsLoggedInStatus = "updateIsLoggedInStatus";
}
