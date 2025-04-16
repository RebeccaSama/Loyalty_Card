import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<void> setStorage(String key, String value) async {
  await storage.write(
    key: key,
    value: value,
  );
}

Future<String?> readStorage({String? value}) async {
  final readStorage = await storage.read(key: value!);
  return readStorage;
}

Future<void> deleteAllStorage() async {
  await storage.deleteAll();
}
