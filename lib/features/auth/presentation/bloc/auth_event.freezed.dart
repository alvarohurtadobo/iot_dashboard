// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoginRequested value)?  loginRequested,TResult Function( _LogoutRequested value)?  logoutRequested,TResult Function( _AuthStatusChecked value)?  authStatusChecked,TResult Function( _GuestLoginRequested value)?  guestLoginRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginRequested() when loginRequested != null:
return loginRequested(_that);case _LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case _AuthStatusChecked() when authStatusChecked != null:
return authStatusChecked(_that);case _GuestLoginRequested() when guestLoginRequested != null:
return guestLoginRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoginRequested value)  loginRequested,required TResult Function( _LogoutRequested value)  logoutRequested,required TResult Function( _AuthStatusChecked value)  authStatusChecked,required TResult Function( _GuestLoginRequested value)  guestLoginRequested,}){
final _that = this;
switch (_that) {
case _LoginRequested():
return loginRequested(_that);case _LogoutRequested():
return logoutRequested(_that);case _AuthStatusChecked():
return authStatusChecked(_that);case _GuestLoginRequested():
return guestLoginRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoginRequested value)?  loginRequested,TResult? Function( _LogoutRequested value)?  logoutRequested,TResult? Function( _AuthStatusChecked value)?  authStatusChecked,TResult? Function( _GuestLoginRequested value)?  guestLoginRequested,}){
final _that = this;
switch (_that) {
case _LoginRequested() when loginRequested != null:
return loginRequested(_that);case _LogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case _AuthStatusChecked() when authStatusChecked != null:
return authStatusChecked(_that);case _GuestLoginRequested() when guestLoginRequested != null:
return guestLoginRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AuthCredentials credentials)?  loginRequested,TResult Function()?  logoutRequested,TResult Function()?  authStatusChecked,TResult Function()?  guestLoginRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginRequested() when loginRequested != null:
return loginRequested(_that.credentials);case _LogoutRequested() when logoutRequested != null:
return logoutRequested();case _AuthStatusChecked() when authStatusChecked != null:
return authStatusChecked();case _GuestLoginRequested() when guestLoginRequested != null:
return guestLoginRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AuthCredentials credentials)  loginRequested,required TResult Function()  logoutRequested,required TResult Function()  authStatusChecked,required TResult Function()  guestLoginRequested,}) {final _that = this;
switch (_that) {
case _LoginRequested():
return loginRequested(_that.credentials);case _LogoutRequested():
return logoutRequested();case _AuthStatusChecked():
return authStatusChecked();case _GuestLoginRequested():
return guestLoginRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AuthCredentials credentials)?  loginRequested,TResult? Function()?  logoutRequested,TResult? Function()?  authStatusChecked,TResult? Function()?  guestLoginRequested,}) {final _that = this;
switch (_that) {
case _LoginRequested() when loginRequested != null:
return loginRequested(_that.credentials);case _LogoutRequested() when logoutRequested != null:
return logoutRequested();case _AuthStatusChecked() when authStatusChecked != null:
return authStatusChecked();case _GuestLoginRequested() when guestLoginRequested != null:
return guestLoginRequested();case _:
  return null;

}
}

}

/// @nodoc


class _LoginRequested implements AuthEvent {
  const _LoginRequested(this.credentials);
  

 final  AuthCredentials credentials;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginRequestedCopyWith<_LoginRequested> get copyWith => __$LoginRequestedCopyWithImpl<_LoginRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginRequested&&(identical(other.credentials, credentials) || other.credentials == credentials));
}


@override
int get hashCode => Object.hash(runtimeType,credentials);

@override
String toString() {
  return 'AuthEvent.loginRequested(credentials: $credentials)';
}


}

/// @nodoc
abstract mixin class _$LoginRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$LoginRequestedCopyWith(_LoginRequested value, $Res Function(_LoginRequested) _then) = __$LoginRequestedCopyWithImpl;
@useResult
$Res call({
 AuthCredentials credentials
});


$AuthCredentialsCopyWith<$Res> get credentials;

}
/// @nodoc
class __$LoginRequestedCopyWithImpl<$Res>
    implements _$LoginRequestedCopyWith<$Res> {
  __$LoginRequestedCopyWithImpl(this._self, this._then);

  final _LoginRequested _self;
  final $Res Function(_LoginRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? credentials = null,}) {
  return _then(_LoginRequested(
null == credentials ? _self.credentials : credentials // ignore: cast_nullable_to_non_nullable
as AuthCredentials,
  ));
}

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthCredentialsCopyWith<$Res> get credentials {
  
  return $AuthCredentialsCopyWith<$Res>(_self.credentials, (value) {
    return _then(_self.copyWith(credentials: value));
  });
}
}

/// @nodoc


class _LogoutRequested implements AuthEvent {
  const _LogoutRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logoutRequested()';
}


}




/// @nodoc


class _AuthStatusChecked implements AuthEvent {
  const _AuthStatusChecked();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStatusChecked);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.authStatusChecked()';
}


}




/// @nodoc


class _GuestLoginRequested implements AuthEvent {
  const _GuestLoginRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuestLoginRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.guestLoginRequested()';
}


}




// dart format on
