// Mocks generated by Mockito 5.0.11 from annotations
// in the_crew_companion/test/controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i9;
import 'dart:ui' as _i3;

import 'package:flutter/src/widgets/framework.dart' as _i10;
import 'package:mockito/mockito.dart' as _i1;
import 'package:package_info_plus/package_info_plus.dart' as _i2;
import 'package:the_crew_companion/controller.dart' as _i4;
import 'package:the_crew_companion/entities/mission.dart' as _i7;
import 'package:the_crew_companion/entities/ruleChapter.dart' as _i8;
import 'package:the_crew_companion/entities/team.dart' as _i6;
import 'package:the_crew_companion/services/missionService.dart' as _i12;
import 'package:the_crew_companion/services/ruleService.dart' as _i11;
import 'package:the_crew_companion/utils/customThemes.dart' as _i5;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakePackageInfo extends _i1.Fake implements _i2.PackageInfo {}

class _FakeLocale extends _i1.Fake implements _i3.Locale {
  @override
  String toString() => super.toString();
}

/// A class which mocks [Controller].
///
/// See the documentation for Mockito's code generation for more information.
class MockController extends _i1.Mock implements _i4.Controller {
  MockController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.PackageInfo get infos => (super.noSuchMethod(Invocation.getter(#infos),
      returnValue: _FakePackageInfo()) as _i2.PackageInfo);
  @override
  set infos(_i2.PackageInfo? _infos) =>
      super.noSuchMethod(Invocation.setter(#infos, _infos),
          returnValueForMissingStub: null);
  @override
  _i5.CustomThemes get defaultTheme =>
      (super.noSuchMethod(Invocation.getter(#defaultTheme),
          returnValue: _i5.CustomThemes.Dark) as _i5.CustomThemes);
  @override
  set defaultTheme(_i5.CustomThemes? _defaultTheme) =>
      super.noSuchMethod(Invocation.setter(#defaultTheme, _defaultTheme),
          returnValueForMissingStub: null);
  @override
  _i3.Locale get defaultLocale =>
      (super.noSuchMethod(Invocation.getter(#defaultLocale),
          returnValue: _FakeLocale()) as _i3.Locale);
  @override
  set defaultLocale(_i3.Locale? _defaultLocale) =>
      super.noSuchMethod(Invocation.setter(#defaultLocale, _defaultLocale),
          returnValueForMissingStub: null);
  @override
  List<_i6.Team> get teams =>
      (super.noSuchMethod(Invocation.getter(#teams), returnValue: <_i6.Team>[])
          as List<_i6.Team>);
  @override
  set teams(List<_i6.Team>? _teams) =>
      super.noSuchMethod(Invocation.setter(#teams, _teams),
          returnValueForMissingStub: null);
  @override
  List<_i7.Mission> get missions =>
      (super.noSuchMethod(Invocation.getter(#missions),
          returnValue: <_i7.Mission>[]) as List<_i7.Mission>);
  @override
  List<_i8.RuleChapter> get rules =>
      (super.noSuchMethod(Invocation.getter(#rules),
          returnValue: <_i8.RuleChapter>[]) as List<_i8.RuleChapter>);
  @override
  String get storageKey =>
      (super.noSuchMethod(Invocation.getter(#storageKey), returnValue: '')
          as String);
  @override
  String get settingsKey =>
      (super.noSuchMethod(Invocation.getter(#settingsKey), returnValue: '')
          as String);
  @override
  String get teamsKey =>
      (super.noSuchMethod(Invocation.getter(#teamsKey), returnValue: '')
          as String);
  @override
  String get appName =>
      (super.noSuchMethod(Invocation.getter(#appName), returnValue: '')
          as String);
  @override
  String get appVersion =>
      (super.noSuchMethod(Invocation.getter(#appVersion), returnValue: '')
          as String);
  @override
  String get buildNumber =>
      (super.noSuchMethod(Invocation.getter(#buildNumber), returnValue: '')
          as String);
  @override
  _i9.Future<void> init() => (super.noSuchMethod(Invocation.method(#init, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> saveSettings(_i10.BuildContext? context) =>
      (super.noSuchMethod(Invocation.method(#saveSettings, [context]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<bool> readSettings() =>
      (super.noSuchMethod(Invocation.method(#readSettings, []),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
  @override
  _i9.Future<void> saveTeams() =>
      (super.noSuchMethod(Invocation.method(#saveTeams, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<bool> readTeams() =>
      (super.noSuchMethod(Invocation.method(#readTeams, []),
          returnValue: Future<bool>.value(false)) as _i9.Future<bool>);
  @override
  _i9.Future<void> populateRules() =>
      (super.noSuchMethod(Invocation.method(#populateRules, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
  @override
  _i9.Future<void> populateMissions() =>
      (super.noSuchMethod(Invocation.method(#populateMissions, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i9.Future<void>);
}

/// A class which mocks [RuleService].
///
/// See the documentation for Mockito's code generation for more information.
class MockRuleService extends _i1.Mock implements _i11.RuleService {
  MockRuleService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i8.RuleChapter> getChapters() =>
      (super.noSuchMethod(Invocation.method(#getChapters, []),
          returnValue: <_i8.RuleChapter>[]) as List<_i8.RuleChapter>);
}

/// A class which mocks [MissionService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMissionService extends _i1.Mock implements _i12.MissionService {
  MockMissionService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i7.Mission> getMissions() =>
      (super.noSuchMethod(Invocation.method(#getMissions, []),
          returnValue: <_i7.Mission>[]) as List<_i7.Mission>);
}
