// Mocks generated by Mockito 5.4.5 from annotations
// in eclipse/test/src/modules/home/domain/usecases/get_favorites_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:eclipse/src/modules/home/domain/entities/apod_entity.dart'
    as _i2;
import 'package:eclipse/src/modules/home/domain/repositories/nasa_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeApodEntity_0 extends _i1.SmartFake implements _i2.ApodEntity {
  _FakeApodEntity_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [NasaRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNasaRepository extends _i1.Mock implements _i3.NasaRepository {
  @override
  _i4.Future<_i2.ApodEntity> getMediaOfDay(String? date) =>
      (super.noSuchMethod(
            Invocation.method(#getMediaOfDay, [date]),
            returnValue: _i4.Future<_i2.ApodEntity>.value(
              _FakeApodEntity_0(
                this,
                Invocation.method(#getMediaOfDay, [date]),
              ),
            ),
            returnValueForMissingStub: _i4.Future<_i2.ApodEntity>.value(
              _FakeApodEntity_0(
                this,
                Invocation.method(#getMediaOfDay, [date]),
              ),
            ),
          )
          as _i4.Future<_i2.ApodEntity>);

  @override
  _i4.Future<Set<_i2.ApodEntity>> getFatorites() =>
      (super.noSuchMethod(
            Invocation.method(#getFatorites, []),
            returnValue: _i4.Future<Set<_i2.ApodEntity>>.value(
              <_i2.ApodEntity>{},
            ),
            returnValueForMissingStub: _i4.Future<Set<_i2.ApodEntity>>.value(
              <_i2.ApodEntity>{},
            ),
          )
          as _i4.Future<Set<_i2.ApodEntity>>);

  @override
  _i4.Future<void> addFavorites(_i2.ApodEntity? data) =>
      (super.noSuchMethod(
            Invocation.method(#addFavorites, [data]),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);

  @override
  _i4.Future<void> removeFavorite(_i2.ApodEntity? data) =>
      (super.noSuchMethod(
            Invocation.method(#removeFavorite, [data]),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);
}
