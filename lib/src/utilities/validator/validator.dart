class BarvValidator {
  const BarvValidator();

  static String? required(String? value, {String? fieldName}) {
    if (value?.isEmpty ?? true) {
      return 'Field ini wajib diisi';
    } else {
      return null;
    }
  }

  static String? emailOrPhone(String? value, {bool required = false}) {
    final text = value ?? '';
    final phoneReg = RegExp(r'^-?\d+$');
    if (phoneReg.hasMatch(text)) {
      if (text.length < 8) {
        return 'No. HP Minimal 8 digit';
      }
      if (text.length > 15) {
        return 'No. HP terlalu panjang, maksimum 15 angka';
      }
    } else {
      final emailRegex = RegExp(
        r"^[a-zA-Z\da-zA-Z.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d-]+\.[a-zA-Z]+",
      );
      if (!emailRegex.hasMatch(text)) {
        return 'Format email salah';
      }
    }

    if (required && text.isEmpty) {
      return 'Field ini wajib diisi';
    }

    return null;
  }

  /// set new / change phone number in setting
  static String? phone(String? value, {bool required = false}) {
    final text = value ?? '';
    final phoneReg = RegExp(r'^-?\d+$');

    if (text.isEmpty) {
      return null;
    } else if (phoneReg.hasMatch(text)) {
      if (text.length < 8) {
        return 'No. HP Minimal 8 digit';
      } else if (!text.startsWith('08')) {
        return 'Format No. HP tidak sesuai. Contoh: 087965268872';
      }
    } else if (!phoneReg.hasMatch(text)) {
      return 'No. HP tidak valid';
    }

    return null;
  }

  /// set new / change email in setting
  /// old pattern: r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$"
  static String? email(String? value, {bool required = false}) {
    final text = value ?? '';
    final emailReg = RegExp(
      r"^[a-zA-Z\da-zA-Z.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d-]+\.[a-zA-Z]+",
    );

    if (text.isEmpty && required) {
      return 'Field ini wajib diisi';
    } else if (text.isEmpty) {
      return null;
    } else if (!emailReg.hasMatch(value ?? '')) {
      return 'Format email salah';
    }

    return null;
  }

  static String? minLength(String? value, int length, {bool required = false}) {
    if (value?.isNotEmpty == true) {
      if (value!.length < length) {
        return 'minimal length is $length';
      }
    }
    if (required && (value?.isEmpty ?? false)) {
      return 'Field ini wajib diisi';
    }

    return null;
  }

  static String? minLengthRekening(String? value, int length,
      {bool required = false}) {
    if (value?.isNotEmpty == true) {
      if (value!.length < length) {
        return 'Nomor rekening minimal $length digit';
      }
    }
    if (required && (value?.isEmpty ?? false)) {
      return 'Field ini wajib diisi';
    }

    return null;
  }

  static String? phoneNumber(String? value, {bool required = false}) {
    final text = value ?? '';
    if (text.isNotEmpty) {
      final phoneReg = RegExp(r'^\d+$');
      if (!phoneReg.hasMatch(text)) {
        return 'Nomor telepon tidak boleh mengandung spesial karakter';
      }

      if (text.length < 8) {
        return 'No. HP Minimal 8 digit';
      }
      if (text.length > 15) {
        return 'No. HP terlalu panjang, maksimum 15 angka';
      }
    }
    if (required && text.isEmpty) {
      return 'Field ini wajib diisi';
    }

    return null;
  }

  static String? address(String? value, {bool required = false}) {
    if (value?.isNotEmpty == true) {
      if (value!.length < 10) {
        return 'Detail alamat minimal 10 karakter';
      } else if (value.length > 150) {
        return 'Detail alamat maksimal 150 karakter';
      }
    }
    if (required && (value?.isEmpty ?? false)) {
      return 'Field ini wajib diisi';
    }

    return null;
  }

  static String? number(String? value,
      {String? errorText, bool required = false}) {
    final text = value ?? '';
    if (text.isNotEmpty) {
      final numberReg = RegExp(r'^-?\d+$');
      if (!numberReg.hasMatch(text)) {
        return errorText ?? 'Inputan tidak valid';
      }
    }
    if (required && text.isEmpty) {
      return 'Field ini wajib diisi';
    }

    return null;
  }

  static String? minimumWordInSentence(String? value, int wordCount,
      {bool required = false}) {
    final text = value ?? '';
    if (text.isNotEmpty) {
      final split = text.trim().split(' ');

      if (split.length < wordCount) {
        return 'Mohon isi lebih dari ${wordCount - 1} kata';
      }
    }
    if (required && text.isEmpty) {
      return 'Field ini wajib diisi';
    }

    return null;
  }
}
