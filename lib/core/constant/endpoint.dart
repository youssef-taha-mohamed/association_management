import '../../feature/user/domain/entities/parameters/read.dart';
import '../../feature/user/domain/entities/parameters/toggle_notification.dart';
import '../../feature/user/domain/entities/profile_modification_data.dart';

class ApiConfig {
  static const String baseUrl = 'https://crowdapi.premiumasp.net/api';

  static const String baseUrlShared = 'https://crowdapi.premiumasp.net';
}

abstract class ApiEndPoint {
  static const isRelease = true;

  static String get baseUrl => ApiConfig.baseUrl;

  // region Auth Endpoints
  static String get sendOtpToResetPassword => '$baseUrl/v1/forget-password';

  static String get register => '$baseUrl/v1/register';

  static String get resetPasswordByOtp => '$baseUrl/v1/reset-password';

  static String get confirmOtpToResetPassword =>
      '$baseUrl/v1/check-reset-password-otp';

  static String get login => '$baseUrl/v1/login';

  static String get logout => '$baseUrl/v1/logout';

  static String get loginWithSocialMedia => '$baseUrl/v1/social/auth';

  static String get sendOtpToVerifyUserAccount =>
      '$baseUrl/v1/check-phone-verification';

  // region User Endpoints
  static String get addFcmToken => '$baseUrl/v1/add_push_message_token';

  static String get delete => '$baseUrl/v1/user/profile/delete';

  static String get userByToken => '$baseUrl/v1/users/by-token';
  static String get verifyAccount => '$baseUrl/v1/verify-phone';

  static String read(ReadUserParameters parameters) =>
      '$baseUrl/v1/users/$parameters';
  static String toggleNotification(ToggleNotificationParameters parameters) =>
      '$baseUrl/v1/users/${parameters.userId}/toggle-notifications';

  static String update(ProfileModificationData parameters) =>
      '$baseUrl/v1/user/profile/${parameters.userId}';

  // region Business Endpoints
  static String get verifyBusiness =>
      '$baseUrl/BusinessVerification/UploadResourcessToVerifyBusiness';

  static String get getVerifyBusinessData =>
      '$baseUrl/BusinessVerification/GetBusinessVerificationResources';

  static String get getBusinessType => '$baseUrl/BusinessType/GetAll';

  static String get getBusinessDashBoard => '$baseUrl/Crowd/GetDashboard';

  static String get getAttendanceSummary =>
      '$baseUrl/Crowd/GetAttendanceSummary';

  // region Profile Endpoints
  static String get updateUser => '$baseUrl/User/UpdateUserAccount';

  static String get updateBusiness => '$baseUrl/User/UpdateBusinessAccount';

  static String getBusinessProfile(String businessId) =>
      '$baseUrl/User/GetBusinessProfile/$businessId';

  // region Crowd Endpoints
  static String get createCrowd => '$baseUrl/Crowd/Create';

  static String get liveCrowd => '$baseUrl/Crowd/GetLiveCrowdsForBusiness';

  static String get crowdsMap => '$baseUrl/Crowd/GetNearestCrowdsOnMap';

  static String liveCrowdDetails(String crowdId) =>
      '$baseUrl/Crowd/GetLiveCrowdDetailForBusiness/$crowdId';

  static String get finishCrowd =>
      '$baseUrl/Crowd/GetFinishedCrowdsForBusiness';

  static String finishCrowdDetials(String crowdId) =>
      '$baseUrl/Crowd/GetFinishedCrowdDetailForBusiness/$crowdId';

  static String get latestCrowd => '$baseUrl/Crowd/GetLatestCrowds';

  static String get nearestCrowd => '$baseUrl/Crowd/NearestCrowds';

  static String get getCrowdsByBusinessTypeId =>
      '$baseUrl/Crowd/GetCrowdsByBussinessTypeId';

  static String get userFavoriteCrowds => '$baseUrl/Crowd/GetFavoriteCrowds';

  static String get getPopularCrowds => '$baseUrl/Crowd/GetPopular';

  static String get userLiveCrowds => '$baseUrl/Crowd/GetLiveCrowds';

  static String get userFinishCrowds => '$baseUrl/Crowd/GetFinishedCrowds';

  static String get getCrowdByBusinessId =>
      '$baseUrl/Crowd/GetCrowdsByBusinessId';

  static String get getCrowdById => '$baseUrl/Crowd/GetCrowdById';

  static String get getSimilarCrowds => '$baseUrl/Crowd/GetSimilarCrowds';

  // region Action Crowd Endpoints
  static String likeCrowd(String crowdId) =>
      '$baseUrl/Like/ToggileLike/$crowdId';

  static String favoriteCrowd(String crowdId) =>
      '$baseUrl/Favorite/ToggileFavorite/$crowdId';

  static String joinCrowd(String crowdId) =>
      '$baseUrl/Subscribe/JoinToCrowd/$crowdId';

  static String get scanUser => '$baseUrl/Subscribe/Scan';

  static String cancelJoinCrowd(String crowdId) =>
      '$baseUrl/Subscribe/CancelJoin/$crowdId';

  // region Package Endpoints
  static String get package => '$baseUrl/Package/GetAll';

  static String get subscribeToPackage => '$baseUrl/Package/JoinToPackage';

  // region Banner Endpoints
  static String get banners => '$baseUrl/Banner/GetBanners';

  // region Notification Endpoints
  static String get allowNotification =>
      '$baseUrl/User/UpdateAllowNotification';

  static String get markNotificationAsRead =>
      '$baseUrl/Notifications/MakeAsRead';

  static String get contactUs => '$baseUrl/ContactUs/Create';

  // region Review Endpoints
  static String get getDashBoardProfileReviews =>
      '$baseUrl/Review/GetProfileReviews';

  static String get getDashBoardCrowReviews =>
      '$baseUrl/Review/GetCrowdReviews';

  static String get getBusinessReviews => '$baseUrl/Review/GetBusinessReviews';

  static String get getReviews => '$baseUrl/Review/GetReviews';

  static String get createReview => '$baseUrl/Review/CreateReview';

  static String get notifications => '$baseUrl/Notifications/GetAll';

  // region Privacy Endpoints
  static String get privacy => '$baseUrl/Privacy/GetPrivacy';

  static String get faq => '$baseUrl/Privacy/GetPrivacy';

// region Country Endpoints
  static String get getCountry => '$baseUrl/Country/GetCountries';
}
