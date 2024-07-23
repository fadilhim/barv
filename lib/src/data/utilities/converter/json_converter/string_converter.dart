import 'package:json_annotation/json_annotation.dart';

/// Converter for parsing both Int and String as String.
class StringIntConverter implements JsonConverter<String, dynamic> {
  /// Creates a converter for parsing both Int and String as String.
  const StringIntConverter();

  @override
  String fromJson(dynamic json) {
    if (json is String) {
      return json;
    } else if (json is int) {
      return json.toString();
    }

    return '';
  }

  @override
  dynamic toJson(String object) {
    return object;
  }
}

/// Converter for parsing '-' into null as '-' as for all intents and purposes
/// it's null coming from our backend.
class DashNullEmptyConverter implements JsonConverter<String?, String?> {
  /// Creates a converter for parsing '-' into null as '-' as for all intents
  /// and purposes it's null coming from our backend.
  const DashNullEmptyConverter();

  @override
  String? fromJson(String? json) {
    if (json != '-' && json != '') {
      return json;
    }

    return null;
  }

  @override
  String? toJson(String? object) {
    return object;
  }
}
