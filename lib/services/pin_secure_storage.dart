import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {

  final storage = const FlutterSecureStorage();

  final String _keyPin = "pin";
  final String _keyClientId = "client_id";
  final String _keyPhoneNumber = "phone_number";
  final String _keyAuthToken = "auth_token";

  Future setUserName(String pin) async {
    await storage.write(key: _keyPin, value: pin);
  }

  Future<String?> getUserName() async {
    return await storage.read(key: _keyPin);
  }

  Future setClientId(String clientId) async {
    await storage.write(key: _keyClientId, value: clientId);
  }

  Future<String?> getClientId() async {
    return await storage.read(key: _keyClientId);
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
