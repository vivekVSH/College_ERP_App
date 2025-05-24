class AuthService {
  static bool _isLoggedIn = false;
  static String? _currentUser;
  static String? _userRole;

  static bool get isLoggedIn => _isLoggedIn;
  static String? get currentUser => _currentUser;
  static String? get userRole => _userRole;

  static Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    
    Map<String, Map<String, String>> users = {
      'student': {'password': '123456', 'role': 'Student'},
      'teacher': {'password': '123456', 'role': 'Teacher'},
      'admin': {'password': '123456', 'role': 'Admin'},
    };

    if (users.containsKey(username) && users[username]!['password'] == password) {
      _isLoggedIn = true;
      _currentUser = username;
      _userRole = users[username]!['role'];
      return true;
    }
    return false;
  }

  static void logout() {
    _isLoggedIn = false;
    _currentUser = null;
    _userRole = null;
  }
}