// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Actor {

 String get name; String get profilePath;
/// Create a copy of Actor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActorCopyWith<Actor> get copyWith => _$ActorCopyWithImpl<Actor>(this as Actor, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Actor&&(identical(other.name, name) || other.name == name)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath));
}


@override
int get hashCode => Object.hash(runtimeType,name,profilePath);

@override
String toString() {
  return 'Actor(name: $name, profilePath: $profilePath)';
}


}

/// @nodoc
abstract mixin class $ActorCopyWith<$Res>  {
  factory $ActorCopyWith(Actor value, $Res Function(Actor) _then) = _$ActorCopyWithImpl;
@useResult
$Res call({
 String name, String profilePath
});




}
/// @nodoc
class _$ActorCopyWithImpl<$Res>
    implements $ActorCopyWith<$Res> {
  _$ActorCopyWithImpl(this._self, this._then);

  final Actor _self;
  final $Res Function(Actor) _then;

/// Create a copy of Actor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? profilePath = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,profilePath: null == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _Actor implements Actor {
  const _Actor({required this.name, required this.profilePath});
  

@override final  String name;
@override final  String profilePath;

/// Create a copy of Actor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActorCopyWith<_Actor> get copyWith => __$ActorCopyWithImpl<_Actor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Actor&&(identical(other.name, name) || other.name == name)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath));
}


@override
int get hashCode => Object.hash(runtimeType,name,profilePath);

@override
String toString() {
  return 'Actor(name: $name, profilePath: $profilePath)';
}


}

/// @nodoc
abstract mixin class _$ActorCopyWith<$Res> implements $ActorCopyWith<$Res> {
  factory _$ActorCopyWith(_Actor value, $Res Function(_Actor) _then) = __$ActorCopyWithImpl;
@override @useResult
$Res call({
 String name, String profilePath
});




}
/// @nodoc
class __$ActorCopyWithImpl<$Res>
    implements _$ActorCopyWith<$Res> {
  __$ActorCopyWithImpl(this._self, this._then);

  final _Actor _self;
  final $Res Function(_Actor) _then;

/// Create a copy of Actor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? profilePath = null,}) {
  return _then(_Actor(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,profilePath: null == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
