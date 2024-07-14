// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'homework.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Homework _$HomeworkFromJson(Map<String, dynamic> json) {
  return _Homework.fromJson(json);
}

/// @nodoc
mixin _$Homework {
  String get className => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeworkCopyWith<Homework> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeworkCopyWith<$Res> {
  factory $HomeworkCopyWith(Homework value, $Res Function(Homework) then) =
      _$HomeworkCopyWithImpl<$Res, Homework>;
  @useResult
  $Res call(
      {String className,
      String subject,
      DateTime deadline,
      String content,
      DateTime timestamp});
}

/// @nodoc
class _$HomeworkCopyWithImpl<$Res, $Val extends Homework>
    implements $HomeworkCopyWith<$Res> {
  _$HomeworkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? className = null,
    Object? subject = null,
    Object? deadline = null,
    Object? content = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      className: null == className
          ? _value.className
          : className // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeworkImplCopyWith<$Res>
    implements $HomeworkCopyWith<$Res> {
  factory _$$HomeworkImplCopyWith(
          _$HomeworkImpl value, $Res Function(_$HomeworkImpl) then) =
      __$$HomeworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String className,
      String subject,
      DateTime deadline,
      String content,
      DateTime timestamp});
}

/// @nodoc
class __$$HomeworkImplCopyWithImpl<$Res>
    extends _$HomeworkCopyWithImpl<$Res, _$HomeworkImpl>
    implements _$$HomeworkImplCopyWith<$Res> {
  __$$HomeworkImplCopyWithImpl(
      _$HomeworkImpl _value, $Res Function(_$HomeworkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? className = null,
    Object? subject = null,
    Object? deadline = null,
    Object? content = null,
    Object? timestamp = null,
  }) {
    return _then(_$HomeworkImpl(
      className: null == className
          ? _value.className
          : className // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeworkImpl implements _Homework {
  const _$HomeworkImpl(
      {required this.className,
      required this.subject,
      required this.deadline,
      required this.content,
      required this.timestamp});

  factory _$HomeworkImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeworkImplFromJson(json);

  @override
  final String className;
  @override
  final String subject;
  @override
  final DateTime deadline;
  @override
  final String content;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'Homework(className: $className, subject: $subject, deadline: $deadline, content: $content, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeworkImpl &&
            (identical(other.className, className) ||
                other.className == className) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, className, subject, deadline, content, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeworkImplCopyWith<_$HomeworkImpl> get copyWith =>
      __$$HomeworkImplCopyWithImpl<_$HomeworkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeworkImplToJson(
      this,
    );
  }
}

abstract class _Homework implements Homework {
  const factory _Homework(
      {required final String className,
      required final String subject,
      required final DateTime deadline,
      required final String content,
      required final DateTime timestamp}) = _$HomeworkImpl;

  factory _Homework.fromJson(Map<String, dynamic> json) =
      _$HomeworkImpl.fromJson;

  @override
  String get className;
  @override
  String get subject;
  @override
  DateTime get deadline;
  @override
  String get content;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$HomeworkImplCopyWith<_$HomeworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
