// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      school: json['school'] as String,
      club: json['club'] as String,
      grade: json['grade'] as String,
      educationLevel: json['educationLevel'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'school': instance.school,
      'club': instance.club,
      'grade': instance.grade,
      'educationLevel': instance.educationLevel,
    };
