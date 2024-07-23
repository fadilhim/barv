import 'package:json_annotation/json_annotation.dart';

/// Converter for parsing both Int and String as Int?.
class IntStringToNullableIntConverter implements JsonConverter<int?, dynamic> {
  /// Creates a converter for parsing both Int and String as Int?.
  const IntStringToNullableIntConverter();

  @override
  int? fromJson(dynamic json) {
    if (json is int) {
      return json;
    } else if (json is String) {
      return int.tryParse(json);
    }

    return null;
  }

  @override
  dynamic toJson(int? object) {
    return object;
  }
}

/// Converter for parsing int into bool.
class IntBoolConverter implements JsonConverter<bool?, dynamic> {
  /// Creates a converter for parsing int into bool.
  const IntBoolConverter();

  @override
  bool? fromJson(dynamic json) {
    if (json is bool?) return json;
    if (json == 1) {
      return true;
    } else if (json == 0) {
      return false;
    }

    return null;
  }

  @override
  int? toJson(bool? object) {
    if (object != null) {
      if (object) {
        return 1;
      } else {
        return 0;
      }
    }

    return null;
  }
}
