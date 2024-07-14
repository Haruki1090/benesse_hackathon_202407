import 'package:benesse_hackathon_202407/utils/date_time_timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'homework.freezed.dart';
part 'homework.g.dart';

@freezed
class Homework with _$Homework {
  const factory Homework({
    required String className,
    required String subject,
    @DateTimeTimestampConverter() required DateTime deadline,
    required String content,
    @TimestampConverter() required Timestamp timestamp,
    required double progress, // 進捗状況フィールドを追加
  }) = _Homework;

  factory Homework.fromJson(Map<String, dynamic> json) =>
      _$HomeworkFromJson(json);
}
