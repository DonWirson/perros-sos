// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JwtToken {
  String jwtToken;

  JwtToken({
    required this.jwtToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jwtToken': jwtToken,
    };
  }

  factory JwtToken.fromMap(Map<String, dynamic> map) {
    return JwtToken(
      jwtToken: map['jwtToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JwtToken.fromJson(String source) =>
      JwtToken.fromMap(json.decode(source) as Map<String, dynamic>);
}
