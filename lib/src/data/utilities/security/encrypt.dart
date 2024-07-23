import 'package:barv/src/config/config.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';

class BarvEncryption {
  BarvEncryption._();

  static AESEncrypt get aes => AESEncrypt();
}

class AESEncrypt {
  /// Enter a plain text to encrypt
  String encrypt(String plainText) {
    final key = Key.fromUtf8(EnvConfig.encryptKey);
    final iv = IV.fromSecureRandom(16);

    final encryptor = Encrypter(AES(key, mode: AESMode.cbc));

    final encrypted = encryptor.encrypt(plainText, iv: iv);

    final ivHex =
        iv.bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
    final encryptedHex =
        encrypted.bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

    return ivHex + encryptedHex;
  }

  /// Enter a cipher text to decrypt
  String decrypt(String cipherText) {
    final key = Key.fromUtf8(EnvConfig.encryptKey);

    final ivHex = cipherText.substring(0, 32);
    final encryptedHex = cipherText.substring(32);

    final iv = IV(Uint8List.fromList(List.generate(ivHex.length ~/ 2,
        (i) => int.parse(ivHex.substring(i * 2, i * 2 + 2), radix: 16))));
    final encryptedBytes = Uint8List.fromList(List.generate(
        encryptedHex.length ~/ 2,
        (i) => int.parse(encryptedHex.substring(i * 2, i * 2 + 2), radix: 16)));

    final encryptor = Encrypter(AES(key, mode: AESMode.cbc));

    final encrypted = Encrypted(encryptedBytes);

    final decrypted = encryptor.decrypt(encrypted, iv: iv);

    return decrypted;
  }
}
