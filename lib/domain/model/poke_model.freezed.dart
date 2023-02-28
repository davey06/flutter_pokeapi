// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poke_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokeListModel _$PokeListModelFromJson(Map<String, dynamic> json) {
  return _PokeListModel.fromJson(json);
}

/// @nodoc
mixin _$PokeListModel {
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokeListModelCopyWith<PokeListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeListModelCopyWith<$Res> {
  factory $PokeListModelCopyWith(
          PokeListModel value, $Res Function(PokeListModel) then) =
      _$PokeListModelCopyWithImpl<$Res, PokeListModel>;
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class _$PokeListModelCopyWithImpl<$Res, $Val extends PokeListModel>
    implements $PokeListModelCopyWith<$Res> {
  _$PokeListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PokeListModelCopyWith<$Res>
    implements $PokeListModelCopyWith<$Res> {
  factory _$$_PokeListModelCopyWith(
          _$_PokeListModel value, $Res Function(_$_PokeListModel) then) =
      __$$_PokeListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String url});
}

/// @nodoc
class __$$_PokeListModelCopyWithImpl<$Res>
    extends _$PokeListModelCopyWithImpl<$Res, _$_PokeListModel>
    implements _$$_PokeListModelCopyWith<$Res> {
  __$$_PokeListModelCopyWithImpl(
      _$_PokeListModel _value, $Res Function(_$_PokeListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$_PokeListModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PokeListModel implements _PokeListModel {
  const _$_PokeListModel({required this.name, required this.url});

  factory _$_PokeListModel.fromJson(Map<String, dynamic> json) =>
      _$$_PokeListModelFromJson(json);

  @override
  final String name;
  @override
  final String url;

  @override
  String toString() {
    return 'PokeListModel(name: $name, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokeListModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokeListModelCopyWith<_$_PokeListModel> get copyWith =>
      __$$_PokeListModelCopyWithImpl<_$_PokeListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PokeListModelToJson(
      this,
    );
  }
}

abstract class _PokeListModel implements PokeListModel {
  const factory _PokeListModel(
      {required final String name,
      required final String url}) = _$_PokeListModel;

  factory _PokeListModel.fromJson(Map<String, dynamic> json) =
      _$_PokeListModel.fromJson;

  @override
  String get name;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_PokeListModelCopyWith<_$_PokeListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PokeDetailModel _$PokeDetailModelFromJson(Map<String, dynamic> json) {
  return _PokeDetailModel.fromJson(json);
}

/// @nodoc
mixin _$PokeDetailModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get abilities => throw _privateConstructorUsedError;
  List<String> get type => throw _privateConstructorUsedError;
  String get artworkUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokeDetailModelCopyWith<PokeDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeDetailModelCopyWith<$Res> {
  factory $PokeDetailModelCopyWith(
          PokeDetailModel value, $Res Function(PokeDetailModel) then) =
      _$PokeDetailModelCopyWithImpl<$Res, PokeDetailModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      List<String> abilities,
      List<String> type,
      String artworkUrl});
}

/// @nodoc
class _$PokeDetailModelCopyWithImpl<$Res, $Val extends PokeDetailModel>
    implements $PokeDetailModelCopyWith<$Res> {
  _$PokeDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? abilities = null,
    Object? type = null,
    Object? artworkUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      abilities: null == abilities
          ? _value.abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<String>,
      artworkUrl: null == artworkUrl
          ? _value.artworkUrl
          : artworkUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PokeDetailModelCopyWith<$Res>
    implements $PokeDetailModelCopyWith<$Res> {
  factory _$$_PokeDetailModelCopyWith(
          _$_PokeDetailModel value, $Res Function(_$_PokeDetailModel) then) =
      __$$_PokeDetailModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      List<String> abilities,
      List<String> type,
      String artworkUrl});
}

/// @nodoc
class __$$_PokeDetailModelCopyWithImpl<$Res>
    extends _$PokeDetailModelCopyWithImpl<$Res, _$_PokeDetailModel>
    implements _$$_PokeDetailModelCopyWith<$Res> {
  __$$_PokeDetailModelCopyWithImpl(
      _$_PokeDetailModel _value, $Res Function(_$_PokeDetailModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? abilities = null,
    Object? type = null,
    Object? artworkUrl = null,
  }) {
    return _then(_$_PokeDetailModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      abilities: null == abilities
          ? _value._abilities
          : abilities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value._type
          : type // ignore: cast_nullable_to_non_nullable
              as List<String>,
      artworkUrl: null == artworkUrl
          ? _value.artworkUrl
          : artworkUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PokeDetailModel implements _PokeDetailModel {
  const _$_PokeDetailModel(
      {required this.id,
      required this.name,
      required final List<String> abilities,
      required final List<String> type,
      required this.artworkUrl})
      : _abilities = abilities,
        _type = type;

  factory _$_PokeDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_PokeDetailModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final List<String> _abilities;
  @override
  List<String> get abilities {
    if (_abilities is EqualUnmodifiableListView) return _abilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilities);
  }

  final List<String> _type;
  @override
  List<String> get type {
    if (_type is EqualUnmodifiableListView) return _type;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_type);
  }

  @override
  final String artworkUrl;

  @override
  String toString() {
    return 'PokeDetailModel(id: $id, name: $name, abilities: $abilities, type: $type, artworkUrl: $artworkUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokeDetailModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._abilities, _abilities) &&
            const DeepCollectionEquality().equals(other._type, _type) &&
            (identical(other.artworkUrl, artworkUrl) ||
                other.artworkUrl == artworkUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_abilities),
      const DeepCollectionEquality().hash(_type),
      artworkUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokeDetailModelCopyWith<_$_PokeDetailModel> get copyWith =>
      __$$_PokeDetailModelCopyWithImpl<_$_PokeDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PokeDetailModelToJson(
      this,
    );
  }
}

abstract class _PokeDetailModel implements PokeDetailModel {
  const factory _PokeDetailModel(
      {required final int id,
      required final String name,
      required final List<String> abilities,
      required final List<String> type,
      required final String artworkUrl}) = _$_PokeDetailModel;

  factory _PokeDetailModel.fromJson(Map<String, dynamic> json) =
      _$_PokeDetailModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<String> get abilities;
  @override
  List<String> get type;
  @override
  String get artworkUrl;
  @override
  @JsonKey(ignore: true)
  _$$_PokeDetailModelCopyWith<_$_PokeDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}
