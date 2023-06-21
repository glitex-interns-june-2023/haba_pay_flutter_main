import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PinSecureStorage {
  // Create storage
  final storage = const FlutterSecureStorage();

  late final String _keyPin;

  Future setUserName(String pin) async {
    await storage.write(key: _keyPin, value: pin);
  }

  Future<String?> getUserName() async {
    return await storage.read(key: _keyPin);
  }
}
