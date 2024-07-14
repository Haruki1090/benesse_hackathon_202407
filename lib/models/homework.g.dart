// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homework.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeworkImpl _$$HomeworkImplFromJson(Map<String, dynamic> json) =>
    _$HomeworkImpl(
      className: json['className'] as String,
      subject: json['subject'] as String,
      deadline: const DateTimeTimestampConverter()
          .fromJson(json['deadline'] as Timestamp),
      content: json['content'] as String,
      timestamp:
          const TimestampConverter().fromJson(json['timestamp'] as Timestamp),
    );

Map<String, dynamic> _$$HomeworkImplToJson(_$HomeworkImpl instance) =>
    <String, dynamic>{
      'className': instance.className,
      'subject': instance.subject,
      'deadline': const DateTimeTimestampConverter().toJson(instance.deadline),
      'content': instance.content,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };
