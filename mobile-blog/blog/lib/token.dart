import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  static Future<int?> getExpiredToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('expires_in');
  }

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('access_token', token);
  }

  static Future<void> usernameToken(String username) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
  }

  static Future<void> expiredToken(int expiresIn) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('expires_in', expiresIn);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('access_token');
    prefs.remove('expires_in');
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('access_token');
  }
}
