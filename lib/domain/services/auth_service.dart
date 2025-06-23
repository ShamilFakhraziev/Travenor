class AuthenticationService {
  Future<void> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 1));
    if (username != 'root' && password != 'root') {
      throw Exception('Username and paswword must be equal "root"!');
    }
  }

  Future<void> logout() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
