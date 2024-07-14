import 'package:freezed_annotation/freezed_annotation.dart';

part 'homework.freezed.dart';
part 'homework.g.dart';

@freezed
class Homework with _$Homework {
  const factory Homework({
    required String className,
    required String subject,
    required DateTime deadline,
    required String content,
    required DateTime timestamp,
  }) = _Homework;

  factory Homework.fromJson(Map<String, dynamic> json) =>
      _$HomeworkFromJson(json);
}
