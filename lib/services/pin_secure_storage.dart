import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {

  final storage = const FlutterSecureStorage();

  final String _keyLocation = "location";
  final String _keyInitials = "initials";
  final String _keyAccountBalance = "account_balance";
  final String _keyUserId = "user_id";
  final String _keyFirstName = "first_name";
  final String _keyLastName = "last_name";
  final String _keyQuickLogin = "quick_login";
  final String _keyPin = "pin";
  final String _keyUserName = "username";
  final String _keyClientId = "client_id";
  final String _keyEmail = "email";
  final String _keyPhoneNumber = "phone_number";
  final String _keyAuthToken = "auth_token";
  final String _keyRefreshToken = "refresh_token";

  Future setInitials(String initials) async {
    await storage.write(key: _keyInitials, value: initials);
  }

  Future<String?> getInitials() async {
    return await storage.read(key: _keyInitials);
  }

  Future setLocation(String location) async {
    await storage.write(key: _keyLocation, value: location);
  }

  Future<String?> getLocation() async {
    return await storage.read(key: _keyLocation);
  }

  Future setUserId(String userId) async {
    await storage.write(key: _keyUserId, value: userId);
  }

  Future<String?> getUserId() async {
    return await storage.read(key: _keyUserId);
  }

  Future setAccountBalance(String accountBalance) async {
    await storage.write(key: _keyAccountBalance, value: accountBalance);
  }

  Future<String?> getAccountBalance() async {
    return await storage.read(key: _keyAccountBalance);
  }

  Future setFirstName(String firstName) async {
    await storage.write(key: _keyFirstName, value: firstName);
  }

  Future<String?> getFirstName() async {
    return await storage.read(key: _keyFirstName);
  }

  Future setLastName(String lastName) async {
    await storage.write(key: _keyLastName, value: lastName);
  }

  Future<String?> getLastName() async {
    return await storage.read(key: _keyLastName);
  }

  Future setRefreshToken(String refreshToken) async {
    await storage.write(key: _keyRefreshToken, value: refreshToken);
  }

  Future<String?> getRefreshToken() async {
    return await storage.read(key: _keyRefreshToken);
  }

  Future setQuickLogin(String quickLogin) async {
    await storage.write(key: _keyQuickLogin, value: quickLogin);
  }

  Future<String?> getQuickLogin() async {
    return await storage.read(key: _keyQuickLogin);
  }

  Future setPin(String pin) async {
    await storage.write(key: _keyPin, value: pin);
  }

  Future<String?> getPin() async {
    return await storage.read(key: _keyPin);
  }

  Future setUserName(String username) async {
    await storage.write(key: _keyUserName, value: username);
  }

  Future<String?> getUserName() async {
    return await storage.read(key: _keyUserName);
  }

  Future setClientId(String clientId) async {
    await storage.write(key: _keyClientId, value: clientId);
  }

  Future<String?> getClientId() async {
    return await storage.read(key: _keyClientId);
  }

  Future setEmail(String email) async {
    await storage.write(key: _keyEmail, value: email);
  }

  Future<String?> getEmail() async {
    return await storage.read(key: _keyEmail);
  }

  Future setPhoneNumber(String phoneNumber) async {
    await storage.write(key: _keyPhoneNumber, value: phoneNumber);
  }

  Future<String?> getPhoneNumber() async {
    return await storage.read(key: _keyPhoneNumber);
  }

  Future setAuthToken(String authToken) async {
    await storage.write(key: _keyAuthToken, value: authToken);
  }

  Future<String?> getAuthToken() async {
    return await storage.read(key: _keyAuthToken);
  }
}
