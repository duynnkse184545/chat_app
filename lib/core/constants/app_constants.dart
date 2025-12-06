class AppConstants {
  // App info
  static const String appName = 'Discord Clone';
  static const String appVersion = '1.0.0';

  // Pagination
  static const int messageLimit = 50;
  static const int serverLimit = 100;
  static const int channelLimit = 50;

  // Validation
  static const int usernameMinLength = 3;
  static const int usernameMaxLength = 20;
  static const int passwordMinLength = 6;
  static const int serverNameMaxLength = 50;
  static const int channelNameMaxLength = 30;
  static const int messageMaxLength = 2000;

  // Image constraints
  static const int maxImageSizeMB = 5;
  static const int maxImageSizeBytes = maxImageSizeMB * 1024 * 1024;

  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration cacheTimeout = Duration(hours: 1);
}