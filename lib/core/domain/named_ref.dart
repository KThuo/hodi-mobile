import 'package:freezed_annotation/freezed_annotation.dart';

part 'named_ref.freezed.dart';
part 'named_ref.g.dart';

/// A named thing with an id — a feature, a category, a caretaker.
///
/// The server calls this shape `Chip` and sends it from three detail endpoints. It is named
/// `NamedRef` here only because `Chip` is a Flutter widget, and a domain model that shadows a
/// widget is a name collision waiting to happen in every file that renders one.
@freezed
abstract class NamedRef with _$NamedRef {
  const NamedRef._();
  const factory NamedRef({
    required String id,
    required String label,

    /// Secondary text: a unit count on a category, a phone number on a caretaker.
    String? note,

    /// An icon key, for the things that have one. Features do; a caretaker does not.
    String? icon,
  }) = _NamedRef;

  factory NamedRef.fromJson(Map<String, dynamic> json) => _$NamedRefFromJson(json);
}
