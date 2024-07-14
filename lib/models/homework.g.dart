// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homework.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeworkImpl _$$HomeworkImplFromJson(Map<String, dynamic> json) =>
    _$HomeworkImpl(
      className: json['className'] as String,
      subject: json['subject'] as String,
      deadline: DateTime.parse(json['deadline'] as String),
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$HomeworkImplToJson(_$HomeworkImpl instance) =>
    <String, dynamic>{
      'className': instance.className,
      'subject': instance.subject,
      'deadline': instance.deadline.toIso8601String(),
      'content': instance.content,
      'timestamp': instance.timestamp.toIso8601String(),
    };
