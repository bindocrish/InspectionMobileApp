import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  String? _token;
  String? _role;
  String? get role => _role;
  bool get isAdmin => _role == 'admin';
  bool get isSuperAdmin => _role == 'SUPER_ADMIN';
  bool get isEmployee => _role == 'INSPECTION_ENGINEER';
  String? get token => _token;
  bool get isLoggedIn => _token != null;

  Future<void> loadToken() async {
    _token = await _storage.read(key: 'auth_token');
    _role = await _storage.read(key: 'user_role');
    notifyListeners();
  }

  Future<void> saveToken(String token,String role) async {
    await _storage.write(key: 'auth_token', value: token);
    await _storage.write(key: 'user_role', value: role);
    _token = token;
    _role = role;
    notifyListeners();
  }

  Future<void> logout() async {
    await _storage.deleteAll();
    _token = null;
    _role = null;
    notifyListeners();
  }
}
