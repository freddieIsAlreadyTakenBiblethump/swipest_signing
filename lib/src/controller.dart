import 'package:flutter/cupertino.dart';

import 'screens/fifth.dart';
import 'screens/first.dart';
import 'screens/fourth.dart';
import 'screens/second.dart';
import 'screens/signin.dart';
import 'screens/third.dart';

class Controller {

  Function(Widget widget)? _setContent;

  final Map<SigningPhase, Widget> _phases = {};

  Controller() {
    _phases[SigningPhase.signIn] = SignIn(this);
    _phases[SigningPhase.first] = const First();
    _phases[SigningPhase.second] = const Second();
    _phases[SigningPhase.third] = const Third();
    _phases[SigningPhase.fourth] = const Fourth();
    _phases[SigningPhase.fifth] = const Fifth();
  }

  void setContentSetter(Function(Widget widget) setContent) {
    _setContent = setContent;
  }

  void show(SigningPhase phase) {
    _setContent!(_phases[phase]!);
  }

  get setContent => _setContent;
}

enum SigningPhase {
  signIn, first, second, third, fourth, fifth, sixth
}