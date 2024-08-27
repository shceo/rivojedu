class ApiConstants {
  static const String baseUrl = 'http://164.90.187.178:8080/api/v1/';
  static const String signIn = '${baseUrl}auth/sign-in';
  static const String allModules = '${baseUrl}student/getAllModules';
  static const String allLessons = '${baseUrl}student/getAllLessonsOfModule';
  static const String getUserData = '${baseUrl}user/get-user-details';
  static const String getRanking= '${baseUrl}progress/get-ranking-page';
  static const String getCoin = '${baseUrl}progress/get-progress';
}
