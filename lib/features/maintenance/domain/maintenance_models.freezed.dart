// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaintenanceRequestModel {

 String get id;/// The reference somebody quotes on the phone.
 String get requestRef; String? get propertyName; String? get houseCode; String? get houseNumber; String? get reporterName; String? get categoryName; String get title; String? get description;/// `LOW`, `NORMAL`, `HIGH`, `URGENT`.
 String? get priority;/// The code — `SUBMITTED`, `ACKNOWLEDGED`, `ASSIGNED`, `IN_PROGRESS`, `ON_HOLD`, `RESOLVED`,
/// `CLOSED`, `REJECTED`, `CANCELLED`.
 String get status;/// The same thing in the server's words, which is what gets shown. The app does not keep its
/// own table of nine status names to fall out of step with.
 String? get statusLabel; String? get statusReason; String? get assigneeName; String? get submittedOn; String? get acknowledgedOn; String? get resolvedOn; String? get closedOn; String? get dueOn;/// Past its target and still open. The server works this out; a client comparing `dueOn` to
/// its own clock would disagree with the office over a timezone.
 bool get slaBreached; bool get late; String? get dueLabel; String? get actionsTaken; String? get resolutionNotes; int? get tenantRating; String? get tenantFeedback;/// Whether it is still live. Sent rather than derived from [status], so a status added on the
/// server does not silently read as closed here.
 bool get open;
/// Create a copy of MaintenanceRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceRequestModelCopyWith<MaintenanceRequestModel> get copyWith => _$MaintenanceRequestModelCopyWithImpl<MaintenanceRequestModel>(this as MaintenanceRequestModel, _$identity);

  /// Serializes this MaintenanceRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.requestRef, requestRef) || other.requestRef == requestRef)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.reporterName, reporterName) || other.reporterName == reporterName)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.statusReason, statusReason) || other.statusReason == statusReason)&&(identical(other.assigneeName, assigneeName) || other.assigneeName == assigneeName)&&(identical(other.submittedOn, submittedOn) || other.submittedOn == submittedOn)&&(identical(other.acknowledgedOn, acknowledgedOn) || other.acknowledgedOn == acknowledgedOn)&&(identical(other.resolvedOn, resolvedOn) || other.resolvedOn == resolvedOn)&&(identical(other.closedOn, closedOn) || other.closedOn == closedOn)&&(identical(other.dueOn, dueOn) || other.dueOn == dueOn)&&(identical(other.slaBreached, slaBreached) || other.slaBreached == slaBreached)&&(identical(other.late, late) || other.late == late)&&(identical(other.dueLabel, dueLabel) || other.dueLabel == dueLabel)&&(identical(other.actionsTaken, actionsTaken) || other.actionsTaken == actionsTaken)&&(identical(other.resolutionNotes, resolutionNotes) || other.resolutionNotes == resolutionNotes)&&(identical(other.tenantRating, tenantRating) || other.tenantRating == tenantRating)&&(identical(other.tenantFeedback, tenantFeedback) || other.tenantFeedback == tenantFeedback)&&(identical(other.open, open) || other.open == open));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,requestRef,propertyName,houseCode,houseNumber,reporterName,categoryName,title,description,priority,status,statusLabel,statusReason,assigneeName,submittedOn,acknowledgedOn,resolvedOn,closedOn,dueOn,slaBreached,late,dueLabel,actionsTaken,resolutionNotes,tenantRating,tenantFeedback,open]);

@override
String toString() {
  return 'MaintenanceRequestModel(id: $id, requestRef: $requestRef, propertyName: $propertyName, houseCode: $houseCode, houseNumber: $houseNumber, reporterName: $reporterName, categoryName: $categoryName, title: $title, description: $description, priority: $priority, status: $status, statusLabel: $statusLabel, statusReason: $statusReason, assigneeName: $assigneeName, submittedOn: $submittedOn, acknowledgedOn: $acknowledgedOn, resolvedOn: $resolvedOn, closedOn: $closedOn, dueOn: $dueOn, slaBreached: $slaBreached, late: $late, dueLabel: $dueLabel, actionsTaken: $actionsTaken, resolutionNotes: $resolutionNotes, tenantRating: $tenantRating, tenantFeedback: $tenantFeedback, open: $open)';
}


}

/// @nodoc
abstract mixin class $MaintenanceRequestModelCopyWith<$Res>  {
  factory $MaintenanceRequestModelCopyWith(MaintenanceRequestModel value, $Res Function(MaintenanceRequestModel) _then) = _$MaintenanceRequestModelCopyWithImpl;
@useResult
$Res call({
 String id, String requestRef, String? propertyName, String? houseCode, String? houseNumber, String? reporterName, String? categoryName, String title, String? description, String? priority, String status, String? statusLabel, String? statusReason, String? assigneeName, String? submittedOn, String? acknowledgedOn, String? resolvedOn, String? closedOn, String? dueOn, bool slaBreached, bool late, String? dueLabel, String? actionsTaken, String? resolutionNotes, int? tenantRating, String? tenantFeedback, bool open
});




}
/// @nodoc
class _$MaintenanceRequestModelCopyWithImpl<$Res>
    implements $MaintenanceRequestModelCopyWith<$Res> {
  _$MaintenanceRequestModelCopyWithImpl(this._self, this._then);

  final MaintenanceRequestModel _self;
  final $Res Function(MaintenanceRequestModel) _then;

/// Create a copy of MaintenanceRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? requestRef = null,Object? propertyName = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? reporterName = freezed,Object? categoryName = freezed,Object? title = null,Object? description = freezed,Object? priority = freezed,Object? status = null,Object? statusLabel = freezed,Object? statusReason = freezed,Object? assigneeName = freezed,Object? submittedOn = freezed,Object? acknowledgedOn = freezed,Object? resolvedOn = freezed,Object? closedOn = freezed,Object? dueOn = freezed,Object? slaBreached = null,Object? late = null,Object? dueLabel = freezed,Object? actionsTaken = freezed,Object? resolutionNotes = freezed,Object? tenantRating = freezed,Object? tenantFeedback = freezed,Object? open = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requestRef: null == requestRef ? _self.requestRef : requestRef // ignore: cast_nullable_to_non_nullable
as String,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,reporterName: freezed == reporterName ? _self.reporterName : reporterName // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,statusReason: freezed == statusReason ? _self.statusReason : statusReason // ignore: cast_nullable_to_non_nullable
as String?,assigneeName: freezed == assigneeName ? _self.assigneeName : assigneeName // ignore: cast_nullable_to_non_nullable
as String?,submittedOn: freezed == submittedOn ? _self.submittedOn : submittedOn // ignore: cast_nullable_to_non_nullable
as String?,acknowledgedOn: freezed == acknowledgedOn ? _self.acknowledgedOn : acknowledgedOn // ignore: cast_nullable_to_non_nullable
as String?,resolvedOn: freezed == resolvedOn ? _self.resolvedOn : resolvedOn // ignore: cast_nullable_to_non_nullable
as String?,closedOn: freezed == closedOn ? _self.closedOn : closedOn // ignore: cast_nullable_to_non_nullable
as String?,dueOn: freezed == dueOn ? _self.dueOn : dueOn // ignore: cast_nullable_to_non_nullable
as String?,slaBreached: null == slaBreached ? _self.slaBreached : slaBreached // ignore: cast_nullable_to_non_nullable
as bool,late: null == late ? _self.late : late // ignore: cast_nullable_to_non_nullable
as bool,dueLabel: freezed == dueLabel ? _self.dueLabel : dueLabel // ignore: cast_nullable_to_non_nullable
as String?,actionsTaken: freezed == actionsTaken ? _self.actionsTaken : actionsTaken // ignore: cast_nullable_to_non_nullable
as String?,resolutionNotes: freezed == resolutionNotes ? _self.resolutionNotes : resolutionNotes // ignore: cast_nullable_to_non_nullable
as String?,tenantRating: freezed == tenantRating ? _self.tenantRating : tenantRating // ignore: cast_nullable_to_non_nullable
as int?,tenantFeedback: freezed == tenantFeedback ? _self.tenantFeedback : tenantFeedback // ignore: cast_nullable_to_non_nullable
as String?,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceRequestModel].
extension MaintenanceRequestModelPatterns on MaintenanceRequestModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceRequestModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceRequestModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceRequestModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String requestRef,  String? propertyName,  String? houseCode,  String? houseNumber,  String? reporterName,  String? categoryName,  String title,  String? description,  String? priority,  String status,  String? statusLabel,  String? statusReason,  String? assigneeName,  String? submittedOn,  String? acknowledgedOn,  String? resolvedOn,  String? closedOn,  String? dueOn,  bool slaBreached,  bool late,  String? dueLabel,  String? actionsTaken,  String? resolutionNotes,  int? tenantRating,  String? tenantFeedback,  bool open)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceRequestModel() when $default != null:
return $default(_that.id,_that.requestRef,_that.propertyName,_that.houseCode,_that.houseNumber,_that.reporterName,_that.categoryName,_that.title,_that.description,_that.priority,_that.status,_that.statusLabel,_that.statusReason,_that.assigneeName,_that.submittedOn,_that.acknowledgedOn,_that.resolvedOn,_that.closedOn,_that.dueOn,_that.slaBreached,_that.late,_that.dueLabel,_that.actionsTaken,_that.resolutionNotes,_that.tenantRating,_that.tenantFeedback,_that.open);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String requestRef,  String? propertyName,  String? houseCode,  String? houseNumber,  String? reporterName,  String? categoryName,  String title,  String? description,  String? priority,  String status,  String? statusLabel,  String? statusReason,  String? assigneeName,  String? submittedOn,  String? acknowledgedOn,  String? resolvedOn,  String? closedOn,  String? dueOn,  bool slaBreached,  bool late,  String? dueLabel,  String? actionsTaken,  String? resolutionNotes,  int? tenantRating,  String? tenantFeedback,  bool open)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceRequestModel():
return $default(_that.id,_that.requestRef,_that.propertyName,_that.houseCode,_that.houseNumber,_that.reporterName,_that.categoryName,_that.title,_that.description,_that.priority,_that.status,_that.statusLabel,_that.statusReason,_that.assigneeName,_that.submittedOn,_that.acknowledgedOn,_that.resolvedOn,_that.closedOn,_that.dueOn,_that.slaBreached,_that.late,_that.dueLabel,_that.actionsTaken,_that.resolutionNotes,_that.tenantRating,_that.tenantFeedback,_that.open);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String requestRef,  String? propertyName,  String? houseCode,  String? houseNumber,  String? reporterName,  String? categoryName,  String title,  String? description,  String? priority,  String status,  String? statusLabel,  String? statusReason,  String? assigneeName,  String? submittedOn,  String? acknowledgedOn,  String? resolvedOn,  String? closedOn,  String? dueOn,  bool slaBreached,  bool late,  String? dueLabel,  String? actionsTaken,  String? resolutionNotes,  int? tenantRating,  String? tenantFeedback,  bool open)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceRequestModel() when $default != null:
return $default(_that.id,_that.requestRef,_that.propertyName,_that.houseCode,_that.houseNumber,_that.reporterName,_that.categoryName,_that.title,_that.description,_that.priority,_that.status,_that.statusLabel,_that.statusReason,_that.assigneeName,_that.submittedOn,_that.acknowledgedOn,_that.resolvedOn,_that.closedOn,_that.dueOn,_that.slaBreached,_that.late,_that.dueLabel,_that.actionsTaken,_that.resolutionNotes,_that.tenantRating,_that.tenantFeedback,_that.open);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceRequestModel extends MaintenanceRequestModel {
  const _MaintenanceRequestModel({required this.id, required this.requestRef, this.propertyName, this.houseCode, this.houseNumber, this.reporterName, this.categoryName, required this.title, this.description, this.priority, required this.status, this.statusLabel, this.statusReason, this.assigneeName, this.submittedOn, this.acknowledgedOn, this.resolvedOn, this.closedOn, this.dueOn, this.slaBreached = false, this.late = false, this.dueLabel, this.actionsTaken, this.resolutionNotes, this.tenantRating, this.tenantFeedback, this.open = false}): super._();
  factory _MaintenanceRequestModel.fromJson(Map<String, dynamic> json) => _$MaintenanceRequestModelFromJson(json);

@override final  String id;
/// The reference somebody quotes on the phone.
@override final  String requestRef;
@override final  String? propertyName;
@override final  String? houseCode;
@override final  String? houseNumber;
@override final  String? reporterName;
@override final  String? categoryName;
@override final  String title;
@override final  String? description;
/// `LOW`, `NORMAL`, `HIGH`, `URGENT`.
@override final  String? priority;
/// The code — `SUBMITTED`, `ACKNOWLEDGED`, `ASSIGNED`, `IN_PROGRESS`, `ON_HOLD`, `RESOLVED`,
/// `CLOSED`, `REJECTED`, `CANCELLED`.
@override final  String status;
/// The same thing in the server's words, which is what gets shown. The app does not keep its
/// own table of nine status names to fall out of step with.
@override final  String? statusLabel;
@override final  String? statusReason;
@override final  String? assigneeName;
@override final  String? submittedOn;
@override final  String? acknowledgedOn;
@override final  String? resolvedOn;
@override final  String? closedOn;
@override final  String? dueOn;
/// Past its target and still open. The server works this out; a client comparing `dueOn` to
/// its own clock would disagree with the office over a timezone.
@override@JsonKey() final  bool slaBreached;
@override@JsonKey() final  bool late;
@override final  String? dueLabel;
@override final  String? actionsTaken;
@override final  String? resolutionNotes;
@override final  int? tenantRating;
@override final  String? tenantFeedback;
/// Whether it is still live. Sent rather than derived from [status], so a status added on the
/// server does not silently read as closed here.
@override@JsonKey() final  bool open;

/// Create a copy of MaintenanceRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceRequestModelCopyWith<_MaintenanceRequestModel> get copyWith => __$MaintenanceRequestModelCopyWithImpl<_MaintenanceRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.requestRef, requestRef) || other.requestRef == requestRef)&&(identical(other.propertyName, propertyName) || other.propertyName == propertyName)&&(identical(other.houseCode, houseCode) || other.houseCode == houseCode)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.reporterName, reporterName) || other.reporterName == reporterName)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.statusReason, statusReason) || other.statusReason == statusReason)&&(identical(other.assigneeName, assigneeName) || other.assigneeName == assigneeName)&&(identical(other.submittedOn, submittedOn) || other.submittedOn == submittedOn)&&(identical(other.acknowledgedOn, acknowledgedOn) || other.acknowledgedOn == acknowledgedOn)&&(identical(other.resolvedOn, resolvedOn) || other.resolvedOn == resolvedOn)&&(identical(other.closedOn, closedOn) || other.closedOn == closedOn)&&(identical(other.dueOn, dueOn) || other.dueOn == dueOn)&&(identical(other.slaBreached, slaBreached) || other.slaBreached == slaBreached)&&(identical(other.late, late) || other.late == late)&&(identical(other.dueLabel, dueLabel) || other.dueLabel == dueLabel)&&(identical(other.actionsTaken, actionsTaken) || other.actionsTaken == actionsTaken)&&(identical(other.resolutionNotes, resolutionNotes) || other.resolutionNotes == resolutionNotes)&&(identical(other.tenantRating, tenantRating) || other.tenantRating == tenantRating)&&(identical(other.tenantFeedback, tenantFeedback) || other.tenantFeedback == tenantFeedback)&&(identical(other.open, open) || other.open == open));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,requestRef,propertyName,houseCode,houseNumber,reporterName,categoryName,title,description,priority,status,statusLabel,statusReason,assigneeName,submittedOn,acknowledgedOn,resolvedOn,closedOn,dueOn,slaBreached,late,dueLabel,actionsTaken,resolutionNotes,tenantRating,tenantFeedback,open]);

@override
String toString() {
  return 'MaintenanceRequestModel(id: $id, requestRef: $requestRef, propertyName: $propertyName, houseCode: $houseCode, houseNumber: $houseNumber, reporterName: $reporterName, categoryName: $categoryName, title: $title, description: $description, priority: $priority, status: $status, statusLabel: $statusLabel, statusReason: $statusReason, assigneeName: $assigneeName, submittedOn: $submittedOn, acknowledgedOn: $acknowledgedOn, resolvedOn: $resolvedOn, closedOn: $closedOn, dueOn: $dueOn, slaBreached: $slaBreached, late: $late, dueLabel: $dueLabel, actionsTaken: $actionsTaken, resolutionNotes: $resolutionNotes, tenantRating: $tenantRating, tenantFeedback: $tenantFeedback, open: $open)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceRequestModelCopyWith<$Res> implements $MaintenanceRequestModelCopyWith<$Res> {
  factory _$MaintenanceRequestModelCopyWith(_MaintenanceRequestModel value, $Res Function(_MaintenanceRequestModel) _then) = __$MaintenanceRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String requestRef, String? propertyName, String? houseCode, String? houseNumber, String? reporterName, String? categoryName, String title, String? description, String? priority, String status, String? statusLabel, String? statusReason, String? assigneeName, String? submittedOn, String? acknowledgedOn, String? resolvedOn, String? closedOn, String? dueOn, bool slaBreached, bool late, String? dueLabel, String? actionsTaken, String? resolutionNotes, int? tenantRating, String? tenantFeedback, bool open
});




}
/// @nodoc
class __$MaintenanceRequestModelCopyWithImpl<$Res>
    implements _$MaintenanceRequestModelCopyWith<$Res> {
  __$MaintenanceRequestModelCopyWithImpl(this._self, this._then);

  final _MaintenanceRequestModel _self;
  final $Res Function(_MaintenanceRequestModel) _then;

/// Create a copy of MaintenanceRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? requestRef = null,Object? propertyName = freezed,Object? houseCode = freezed,Object? houseNumber = freezed,Object? reporterName = freezed,Object? categoryName = freezed,Object? title = null,Object? description = freezed,Object? priority = freezed,Object? status = null,Object? statusLabel = freezed,Object? statusReason = freezed,Object? assigneeName = freezed,Object? submittedOn = freezed,Object? acknowledgedOn = freezed,Object? resolvedOn = freezed,Object? closedOn = freezed,Object? dueOn = freezed,Object? slaBreached = null,Object? late = null,Object? dueLabel = freezed,Object? actionsTaken = freezed,Object? resolutionNotes = freezed,Object? tenantRating = freezed,Object? tenantFeedback = freezed,Object? open = null,}) {
  return _then(_MaintenanceRequestModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requestRef: null == requestRef ? _self.requestRef : requestRef // ignore: cast_nullable_to_non_nullable
as String,propertyName: freezed == propertyName ? _self.propertyName : propertyName // ignore: cast_nullable_to_non_nullable
as String?,houseCode: freezed == houseCode ? _self.houseCode : houseCode // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,reporterName: freezed == reporterName ? _self.reporterName : reporterName // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,statusReason: freezed == statusReason ? _self.statusReason : statusReason // ignore: cast_nullable_to_non_nullable
as String?,assigneeName: freezed == assigneeName ? _self.assigneeName : assigneeName // ignore: cast_nullable_to_non_nullable
as String?,submittedOn: freezed == submittedOn ? _self.submittedOn : submittedOn // ignore: cast_nullable_to_non_nullable
as String?,acknowledgedOn: freezed == acknowledgedOn ? _self.acknowledgedOn : acknowledgedOn // ignore: cast_nullable_to_non_nullable
as String?,resolvedOn: freezed == resolvedOn ? _self.resolvedOn : resolvedOn // ignore: cast_nullable_to_non_nullable
as String?,closedOn: freezed == closedOn ? _self.closedOn : closedOn // ignore: cast_nullable_to_non_nullable
as String?,dueOn: freezed == dueOn ? _self.dueOn : dueOn // ignore: cast_nullable_to_non_nullable
as String?,slaBreached: null == slaBreached ? _self.slaBreached : slaBreached // ignore: cast_nullable_to_non_nullable
as bool,late: null == late ? _self.late : late // ignore: cast_nullable_to_non_nullable
as bool,dueLabel: freezed == dueLabel ? _self.dueLabel : dueLabel // ignore: cast_nullable_to_non_nullable
as String?,actionsTaken: freezed == actionsTaken ? _self.actionsTaken : actionsTaken // ignore: cast_nullable_to_non_nullable
as String?,resolutionNotes: freezed == resolutionNotes ? _self.resolutionNotes : resolutionNotes // ignore: cast_nullable_to_non_nullable
as String?,tenantRating: freezed == tenantRating ? _self.tenantRating : tenantRating // ignore: cast_nullable_to_non_nullable
as int?,tenantFeedback: freezed == tenantFeedback ? _self.tenantFeedback : tenantFeedback // ignore: cast_nullable_to_non_nullable
as String?,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MaintenanceDetailModel {

 MaintenanceRequestModel get request;/// Oldest first, as the server sends it — a repair reads forwards.
 List<MaintenanceUpdateModel> get timeline;
/// Create a copy of MaintenanceDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceDetailModelCopyWith<MaintenanceDetailModel> get copyWith => _$MaintenanceDetailModelCopyWithImpl<MaintenanceDetailModel>(this as MaintenanceDetailModel, _$identity);

  /// Serializes this MaintenanceDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceDetailModel&&(identical(other.request, request) || other.request == request)&&const DeepCollectionEquality().equals(other.timeline, timeline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,request,const DeepCollectionEquality().hash(timeline));

@override
String toString() {
  return 'MaintenanceDetailModel(request: $request, timeline: $timeline)';
}


}

/// @nodoc
abstract mixin class $MaintenanceDetailModelCopyWith<$Res>  {
  factory $MaintenanceDetailModelCopyWith(MaintenanceDetailModel value, $Res Function(MaintenanceDetailModel) _then) = _$MaintenanceDetailModelCopyWithImpl;
@useResult
$Res call({
 MaintenanceRequestModel request, List<MaintenanceUpdateModel> timeline
});


$MaintenanceRequestModelCopyWith<$Res> get request;

}
/// @nodoc
class _$MaintenanceDetailModelCopyWithImpl<$Res>
    implements $MaintenanceDetailModelCopyWith<$Res> {
  _$MaintenanceDetailModelCopyWithImpl(this._self, this._then);

  final MaintenanceDetailModel _self;
  final $Res Function(MaintenanceDetailModel) _then;

/// Create a copy of MaintenanceDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? request = null,Object? timeline = null,}) {
  return _then(_self.copyWith(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as MaintenanceRequestModel,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<MaintenanceUpdateModel>,
  ));
}
/// Create a copy of MaintenanceDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenanceRequestModelCopyWith<$Res> get request {
  
  return $MaintenanceRequestModelCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}


/// Adds pattern-matching-related methods to [MaintenanceDetailModel].
extension MaintenanceDetailModelPatterns on MaintenanceDetailModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceDetailModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceDetailModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceDetailModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MaintenanceRequestModel request,  List<MaintenanceUpdateModel> timeline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceDetailModel() when $default != null:
return $default(_that.request,_that.timeline);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MaintenanceRequestModel request,  List<MaintenanceUpdateModel> timeline)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceDetailModel():
return $default(_that.request,_that.timeline);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MaintenanceRequestModel request,  List<MaintenanceUpdateModel> timeline)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceDetailModel() when $default != null:
return $default(_that.request,_that.timeline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceDetailModel extends MaintenanceDetailModel {
  const _MaintenanceDetailModel({required this.request, final  List<MaintenanceUpdateModel> timeline = const <MaintenanceUpdateModel>[]}): _timeline = timeline,super._();
  factory _MaintenanceDetailModel.fromJson(Map<String, dynamic> json) => _$MaintenanceDetailModelFromJson(json);

@override final  MaintenanceRequestModel request;
/// Oldest first, as the server sends it — a repair reads forwards.
 final  List<MaintenanceUpdateModel> _timeline;
/// Oldest first, as the server sends it — a repair reads forwards.
@override@JsonKey() List<MaintenanceUpdateModel> get timeline {
  if (_timeline is EqualUnmodifiableListView) return _timeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeline);
}


/// Create a copy of MaintenanceDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceDetailModelCopyWith<_MaintenanceDetailModel> get copyWith => __$MaintenanceDetailModelCopyWithImpl<_MaintenanceDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceDetailModel&&(identical(other.request, request) || other.request == request)&&const DeepCollectionEquality().equals(other._timeline, _timeline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,request,const DeepCollectionEquality().hash(_timeline));

@override
String toString() {
  return 'MaintenanceDetailModel(request: $request, timeline: $timeline)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceDetailModelCopyWith<$Res> implements $MaintenanceDetailModelCopyWith<$Res> {
  factory _$MaintenanceDetailModelCopyWith(_MaintenanceDetailModel value, $Res Function(_MaintenanceDetailModel) _then) = __$MaintenanceDetailModelCopyWithImpl;
@override @useResult
$Res call({
 MaintenanceRequestModel request, List<MaintenanceUpdateModel> timeline
});


@override $MaintenanceRequestModelCopyWith<$Res> get request;

}
/// @nodoc
class __$MaintenanceDetailModelCopyWithImpl<$Res>
    implements _$MaintenanceDetailModelCopyWith<$Res> {
  __$MaintenanceDetailModelCopyWithImpl(this._self, this._then);

  final _MaintenanceDetailModel _self;
  final $Res Function(_MaintenanceDetailModel) _then;

/// Create a copy of MaintenanceDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? request = null,Object? timeline = null,}) {
  return _then(_MaintenanceDetailModel(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as MaintenanceRequestModel,timeline: null == timeline ? _self._timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<MaintenanceUpdateModel>,
  ));
}

/// Create a copy of MaintenanceDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MaintenanceRequestModelCopyWith<$Res> get request {
  
  return $MaintenanceRequestModelCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}


/// @nodoc
mixin _$MaintenanceUpdateModel {

 String get id;/// `COMMENT`, `STATUS`, `ASSIGNMENT` — what kind of entry this is.
 String? get updateType; String? get fromLabel; String? get toLabel; String? get comment;/// Whether the tenant may see it. The server already withholds what they may not, so this is
/// for labelling a staff-only note as one — not for deciding whether to render it.
 bool get visibleToTenant; String? get performedByName; String? get performedOn;
/// Create a copy of MaintenanceUpdateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceUpdateModelCopyWith<MaintenanceUpdateModel> get copyWith => _$MaintenanceUpdateModelCopyWithImpl<MaintenanceUpdateModel>(this as MaintenanceUpdateModel, _$identity);

  /// Serializes this MaintenanceUpdateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceUpdateModel&&(identical(other.id, id) || other.id == id)&&(identical(other.updateType, updateType) || other.updateType == updateType)&&(identical(other.fromLabel, fromLabel) || other.fromLabel == fromLabel)&&(identical(other.toLabel, toLabel) || other.toLabel == toLabel)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.visibleToTenant, visibleToTenant) || other.visibleToTenant == visibleToTenant)&&(identical(other.performedByName, performedByName) || other.performedByName == performedByName)&&(identical(other.performedOn, performedOn) || other.performedOn == performedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,updateType,fromLabel,toLabel,comment,visibleToTenant,performedByName,performedOn);

@override
String toString() {
  return 'MaintenanceUpdateModel(id: $id, updateType: $updateType, fromLabel: $fromLabel, toLabel: $toLabel, comment: $comment, visibleToTenant: $visibleToTenant, performedByName: $performedByName, performedOn: $performedOn)';
}


}

/// @nodoc
abstract mixin class $MaintenanceUpdateModelCopyWith<$Res>  {
  factory $MaintenanceUpdateModelCopyWith(MaintenanceUpdateModel value, $Res Function(MaintenanceUpdateModel) _then) = _$MaintenanceUpdateModelCopyWithImpl;
@useResult
$Res call({
 String id, String? updateType, String? fromLabel, String? toLabel, String? comment, bool visibleToTenant, String? performedByName, String? performedOn
});




}
/// @nodoc
class _$MaintenanceUpdateModelCopyWithImpl<$Res>
    implements $MaintenanceUpdateModelCopyWith<$Res> {
  _$MaintenanceUpdateModelCopyWithImpl(this._self, this._then);

  final MaintenanceUpdateModel _self;
  final $Res Function(MaintenanceUpdateModel) _then;

/// Create a copy of MaintenanceUpdateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? updateType = freezed,Object? fromLabel = freezed,Object? toLabel = freezed,Object? comment = freezed,Object? visibleToTenant = null,Object? performedByName = freezed,Object? performedOn = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,updateType: freezed == updateType ? _self.updateType : updateType // ignore: cast_nullable_to_non_nullable
as String?,fromLabel: freezed == fromLabel ? _self.fromLabel : fromLabel // ignore: cast_nullable_to_non_nullable
as String?,toLabel: freezed == toLabel ? _self.toLabel : toLabel // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,visibleToTenant: null == visibleToTenant ? _self.visibleToTenant : visibleToTenant // ignore: cast_nullable_to_non_nullable
as bool,performedByName: freezed == performedByName ? _self.performedByName : performedByName // ignore: cast_nullable_to_non_nullable
as String?,performedOn: freezed == performedOn ? _self.performedOn : performedOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceUpdateModel].
extension MaintenanceUpdateModelPatterns on MaintenanceUpdateModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceUpdateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceUpdateModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceUpdateModel value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceUpdateModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceUpdateModel value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceUpdateModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? updateType,  String? fromLabel,  String? toLabel,  String? comment,  bool visibleToTenant,  String? performedByName,  String? performedOn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceUpdateModel() when $default != null:
return $default(_that.id,_that.updateType,_that.fromLabel,_that.toLabel,_that.comment,_that.visibleToTenant,_that.performedByName,_that.performedOn);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? updateType,  String? fromLabel,  String? toLabel,  String? comment,  bool visibleToTenant,  String? performedByName,  String? performedOn)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceUpdateModel():
return $default(_that.id,_that.updateType,_that.fromLabel,_that.toLabel,_that.comment,_that.visibleToTenant,_that.performedByName,_that.performedOn);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? updateType,  String? fromLabel,  String? toLabel,  String? comment,  bool visibleToTenant,  String? performedByName,  String? performedOn)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceUpdateModel() when $default != null:
return $default(_that.id,_that.updateType,_that.fromLabel,_that.toLabel,_that.comment,_that.visibleToTenant,_that.performedByName,_that.performedOn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceUpdateModel extends MaintenanceUpdateModel {
  const _MaintenanceUpdateModel({required this.id, this.updateType, this.fromLabel, this.toLabel, this.comment, this.visibleToTenant = true, this.performedByName, this.performedOn}): super._();
  factory _MaintenanceUpdateModel.fromJson(Map<String, dynamic> json) => _$MaintenanceUpdateModelFromJson(json);

@override final  String id;
/// `COMMENT`, `STATUS`, `ASSIGNMENT` — what kind of entry this is.
@override final  String? updateType;
@override final  String? fromLabel;
@override final  String? toLabel;
@override final  String? comment;
/// Whether the tenant may see it. The server already withholds what they may not, so this is
/// for labelling a staff-only note as one — not for deciding whether to render it.
@override@JsonKey() final  bool visibleToTenant;
@override final  String? performedByName;
@override final  String? performedOn;

/// Create a copy of MaintenanceUpdateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceUpdateModelCopyWith<_MaintenanceUpdateModel> get copyWith => __$MaintenanceUpdateModelCopyWithImpl<_MaintenanceUpdateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceUpdateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceUpdateModel&&(identical(other.id, id) || other.id == id)&&(identical(other.updateType, updateType) || other.updateType == updateType)&&(identical(other.fromLabel, fromLabel) || other.fromLabel == fromLabel)&&(identical(other.toLabel, toLabel) || other.toLabel == toLabel)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.visibleToTenant, visibleToTenant) || other.visibleToTenant == visibleToTenant)&&(identical(other.performedByName, performedByName) || other.performedByName == performedByName)&&(identical(other.performedOn, performedOn) || other.performedOn == performedOn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,updateType,fromLabel,toLabel,comment,visibleToTenant,performedByName,performedOn);

@override
String toString() {
  return 'MaintenanceUpdateModel(id: $id, updateType: $updateType, fromLabel: $fromLabel, toLabel: $toLabel, comment: $comment, visibleToTenant: $visibleToTenant, performedByName: $performedByName, performedOn: $performedOn)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceUpdateModelCopyWith<$Res> implements $MaintenanceUpdateModelCopyWith<$Res> {
  factory _$MaintenanceUpdateModelCopyWith(_MaintenanceUpdateModel value, $Res Function(_MaintenanceUpdateModel) _then) = __$MaintenanceUpdateModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? updateType, String? fromLabel, String? toLabel, String? comment, bool visibleToTenant, String? performedByName, String? performedOn
});




}
/// @nodoc
class __$MaintenanceUpdateModelCopyWithImpl<$Res>
    implements _$MaintenanceUpdateModelCopyWith<$Res> {
  __$MaintenanceUpdateModelCopyWithImpl(this._self, this._then);

  final _MaintenanceUpdateModel _self;
  final $Res Function(_MaintenanceUpdateModel) _then;

/// Create a copy of MaintenanceUpdateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? updateType = freezed,Object? fromLabel = freezed,Object? toLabel = freezed,Object? comment = freezed,Object? visibleToTenant = null,Object? performedByName = freezed,Object? performedOn = freezed,}) {
  return _then(_MaintenanceUpdateModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,updateType: freezed == updateType ? _self.updateType : updateType // ignore: cast_nullable_to_non_nullable
as String?,fromLabel: freezed == fromLabel ? _self.fromLabel : fromLabel // ignore: cast_nullable_to_non_nullable
as String?,toLabel: freezed == toLabel ? _self.toLabel : toLabel // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,visibleToTenant: null == visibleToTenant ? _self.visibleToTenant : visibleToTenant // ignore: cast_nullable_to_non_nullable
as bool,performedByName: freezed == performedByName ? _self.performedByName : performedByName // ignore: cast_nullable_to_non_nullable
as String?,performedOn: freezed == performedOn ? _self.performedOn : performedOn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MaintenanceCategoryModel {

 String get id; String get name; String? get defaultPriority; String? get estateName;/// A category the platform ships, as opposed to one an estate added.
 bool get platform; int get status;
/// Create a copy of MaintenanceCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceCategoryModelCopyWith<MaintenanceCategoryModel> get copyWith => _$MaintenanceCategoryModelCopyWithImpl<MaintenanceCategoryModel>(this as MaintenanceCategoryModel, _$identity);

  /// Serializes this MaintenanceCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.defaultPriority, defaultPriority) || other.defaultPriority == defaultPriority)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,defaultPriority,estateName,platform,status);

@override
String toString() {
  return 'MaintenanceCategoryModel(id: $id, name: $name, defaultPriority: $defaultPriority, estateName: $estateName, platform: $platform, status: $status)';
}


}

/// @nodoc
abstract mixin class $MaintenanceCategoryModelCopyWith<$Res>  {
  factory $MaintenanceCategoryModelCopyWith(MaintenanceCategoryModel value, $Res Function(MaintenanceCategoryModel) _then) = _$MaintenanceCategoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? defaultPriority, String? estateName, bool platform, int status
});




}
/// @nodoc
class _$MaintenanceCategoryModelCopyWithImpl<$Res>
    implements $MaintenanceCategoryModelCopyWith<$Res> {
  _$MaintenanceCategoryModelCopyWithImpl(this._self, this._then);

  final MaintenanceCategoryModel _self;
  final $Res Function(MaintenanceCategoryModel) _then;

/// Create a copy of MaintenanceCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? defaultPriority = freezed,Object? estateName = freezed,Object? platform = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,defaultPriority: freezed == defaultPriority ? _self.defaultPriority : defaultPriority // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceCategoryModel].
extension MaintenanceCategoryModelPatterns on MaintenanceCategoryModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceCategoryModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceCategoryModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceCategoryModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? defaultPriority,  String? estateName,  bool platform,  int status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.defaultPriority,_that.estateName,_that.platform,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? defaultPriority,  String? estateName,  bool platform,  int status)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceCategoryModel():
return $default(_that.id,_that.name,_that.defaultPriority,_that.estateName,_that.platform,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? defaultPriority,  String? estateName,  bool platform,  int status)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.defaultPriority,_that.estateName,_that.platform,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceCategoryModel extends MaintenanceCategoryModel {
  const _MaintenanceCategoryModel({required this.id, required this.name, this.defaultPriority, this.estateName, this.platform = false, this.status = 0}): super._();
  factory _MaintenanceCategoryModel.fromJson(Map<String, dynamic> json) => _$MaintenanceCategoryModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? defaultPriority;
@override final  String? estateName;
/// A category the platform ships, as opposed to one an estate added.
@override@JsonKey() final  bool platform;
@override@JsonKey() final  int status;

/// Create a copy of MaintenanceCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceCategoryModelCopyWith<_MaintenanceCategoryModel> get copyWith => __$MaintenanceCategoryModelCopyWithImpl<_MaintenanceCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.defaultPriority, defaultPriority) || other.defaultPriority == defaultPriority)&&(identical(other.estateName, estateName) || other.estateName == estateName)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,defaultPriority,estateName,platform,status);

@override
String toString() {
  return 'MaintenanceCategoryModel(id: $id, name: $name, defaultPriority: $defaultPriority, estateName: $estateName, platform: $platform, status: $status)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceCategoryModelCopyWith<$Res> implements $MaintenanceCategoryModelCopyWith<$Res> {
  factory _$MaintenanceCategoryModelCopyWith(_MaintenanceCategoryModel value, $Res Function(_MaintenanceCategoryModel) _then) = __$MaintenanceCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? defaultPriority, String? estateName, bool platform, int status
});




}
/// @nodoc
class __$MaintenanceCategoryModelCopyWithImpl<$Res>
    implements _$MaintenanceCategoryModelCopyWith<$Res> {
  __$MaintenanceCategoryModelCopyWithImpl(this._self, this._then);

  final _MaintenanceCategoryModel _self;
  final $Res Function(_MaintenanceCategoryModel) _then;

/// Create a copy of MaintenanceCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? defaultPriority = freezed,Object? estateName = freezed,Object? platform = null,Object? status = null,}) {
  return _then(_MaintenanceCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,defaultPriority: freezed == defaultPriority ? _self.defaultPriority : defaultPriority // ignore: cast_nullable_to_non_nullable
as String?,estateName: freezed == estateName ? _self.estateName : estateName // ignore: cast_nullable_to_non_nullable
as String?,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MaintenanceWorkloadModel {

@JsonKey(fromJson: parseIntOrZero) int get open;@JsonKey(fromJson: parseIntOrZero) int get unassigned;@JsonKey(fromJson: parseIntOrZero) int get late;@JsonKey(fromJson: parseIntOrZero) int get awaitingClosure;
/// Create a copy of MaintenanceWorkloadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceWorkloadModelCopyWith<MaintenanceWorkloadModel> get copyWith => _$MaintenanceWorkloadModelCopyWithImpl<MaintenanceWorkloadModel>(this as MaintenanceWorkloadModel, _$identity);

  /// Serializes this MaintenanceWorkloadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaintenanceWorkloadModel&&(identical(other.open, open) || other.open == open)&&(identical(other.unassigned, unassigned) || other.unassigned == unassigned)&&(identical(other.late, late) || other.late == late)&&(identical(other.awaitingClosure, awaitingClosure) || other.awaitingClosure == awaitingClosure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,open,unassigned,late,awaitingClosure);

@override
String toString() {
  return 'MaintenanceWorkloadModel(open: $open, unassigned: $unassigned, late: $late, awaitingClosure: $awaitingClosure)';
}


}

/// @nodoc
abstract mixin class $MaintenanceWorkloadModelCopyWith<$Res>  {
  factory $MaintenanceWorkloadModelCopyWith(MaintenanceWorkloadModel value, $Res Function(MaintenanceWorkloadModel) _then) = _$MaintenanceWorkloadModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: parseIntOrZero) int open,@JsonKey(fromJson: parseIntOrZero) int unassigned,@JsonKey(fromJson: parseIntOrZero) int late,@JsonKey(fromJson: parseIntOrZero) int awaitingClosure
});




}
/// @nodoc
class _$MaintenanceWorkloadModelCopyWithImpl<$Res>
    implements $MaintenanceWorkloadModelCopyWith<$Res> {
  _$MaintenanceWorkloadModelCopyWithImpl(this._self, this._then);

  final MaintenanceWorkloadModel _self;
  final $Res Function(MaintenanceWorkloadModel) _then;

/// Create a copy of MaintenanceWorkloadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? open = null,Object? unassigned = null,Object? late = null,Object? awaitingClosure = null,}) {
  return _then(_self.copyWith(
open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as int,unassigned: null == unassigned ? _self.unassigned : unassigned // ignore: cast_nullable_to_non_nullable
as int,late: null == late ? _self.late : late // ignore: cast_nullable_to_non_nullable
as int,awaitingClosure: null == awaitingClosure ? _self.awaitingClosure : awaitingClosure // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MaintenanceWorkloadModel].
extension MaintenanceWorkloadModelPatterns on MaintenanceWorkloadModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaintenanceWorkloadModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaintenanceWorkloadModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaintenanceWorkloadModel value)  $default,){
final _that = this;
switch (_that) {
case _MaintenanceWorkloadModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaintenanceWorkloadModel value)?  $default,){
final _that = this;
switch (_that) {
case _MaintenanceWorkloadModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseIntOrZero)  int open, @JsonKey(fromJson: parseIntOrZero)  int unassigned, @JsonKey(fromJson: parseIntOrZero)  int late, @JsonKey(fromJson: parseIntOrZero)  int awaitingClosure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaintenanceWorkloadModel() when $default != null:
return $default(_that.open,_that.unassigned,_that.late,_that.awaitingClosure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: parseIntOrZero)  int open, @JsonKey(fromJson: parseIntOrZero)  int unassigned, @JsonKey(fromJson: parseIntOrZero)  int late, @JsonKey(fromJson: parseIntOrZero)  int awaitingClosure)  $default,) {final _that = this;
switch (_that) {
case _MaintenanceWorkloadModel():
return $default(_that.open,_that.unassigned,_that.late,_that.awaitingClosure);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: parseIntOrZero)  int open, @JsonKey(fromJson: parseIntOrZero)  int unassigned, @JsonKey(fromJson: parseIntOrZero)  int late, @JsonKey(fromJson: parseIntOrZero)  int awaitingClosure)?  $default,) {final _that = this;
switch (_that) {
case _MaintenanceWorkloadModel() when $default != null:
return $default(_that.open,_that.unassigned,_that.late,_that.awaitingClosure);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaintenanceWorkloadModel extends MaintenanceWorkloadModel {
  const _MaintenanceWorkloadModel({@JsonKey(fromJson: parseIntOrZero) this.open = 0, @JsonKey(fromJson: parseIntOrZero) this.unassigned = 0, @JsonKey(fromJson: parseIntOrZero) this.late = 0, @JsonKey(fromJson: parseIntOrZero) this.awaitingClosure = 0}): super._();
  factory _MaintenanceWorkloadModel.fromJson(Map<String, dynamic> json) => _$MaintenanceWorkloadModelFromJson(json);

@override@JsonKey(fromJson: parseIntOrZero) final  int open;
@override@JsonKey(fromJson: parseIntOrZero) final  int unassigned;
@override@JsonKey(fromJson: parseIntOrZero) final  int late;
@override@JsonKey(fromJson: parseIntOrZero) final  int awaitingClosure;

/// Create a copy of MaintenanceWorkloadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceWorkloadModelCopyWith<_MaintenanceWorkloadModel> get copyWith => __$MaintenanceWorkloadModelCopyWithImpl<_MaintenanceWorkloadModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceWorkloadModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaintenanceWorkloadModel&&(identical(other.open, open) || other.open == open)&&(identical(other.unassigned, unassigned) || other.unassigned == unassigned)&&(identical(other.late, late) || other.late == late)&&(identical(other.awaitingClosure, awaitingClosure) || other.awaitingClosure == awaitingClosure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,open,unassigned,late,awaitingClosure);

@override
String toString() {
  return 'MaintenanceWorkloadModel(open: $open, unassigned: $unassigned, late: $late, awaitingClosure: $awaitingClosure)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceWorkloadModelCopyWith<$Res> implements $MaintenanceWorkloadModelCopyWith<$Res> {
  factory _$MaintenanceWorkloadModelCopyWith(_MaintenanceWorkloadModel value, $Res Function(_MaintenanceWorkloadModel) _then) = __$MaintenanceWorkloadModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: parseIntOrZero) int open,@JsonKey(fromJson: parseIntOrZero) int unassigned,@JsonKey(fromJson: parseIntOrZero) int late,@JsonKey(fromJson: parseIntOrZero) int awaitingClosure
});




}
/// @nodoc
class __$MaintenanceWorkloadModelCopyWithImpl<$Res>
    implements _$MaintenanceWorkloadModelCopyWith<$Res> {
  __$MaintenanceWorkloadModelCopyWithImpl(this._self, this._then);

  final _MaintenanceWorkloadModel _self;
  final $Res Function(_MaintenanceWorkloadModel) _then;

/// Create a copy of MaintenanceWorkloadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? open = null,Object? unassigned = null,Object? late = null,Object? awaitingClosure = null,}) {
  return _then(_MaintenanceWorkloadModel(
open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as int,unassigned: null == unassigned ? _self.unassigned : unassigned // ignore: cast_nullable_to_non_nullable
as int,late: null == late ? _self.late : late // ignore: cast_nullable_to_non_nullable
as int,awaitingClosure: null == awaitingClosure ? _self.awaitingClosure : awaitingClosure // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
