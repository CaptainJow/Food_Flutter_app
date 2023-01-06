class APiEndPoints {
  static const String baseURL = "https://localhost:7232/";
  static AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints {
  final String registerEmail = "api/Users";
  final String loginEmail = "api/Users/login";
}
