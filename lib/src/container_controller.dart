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
    _phases[SigningPhase.signIn] = const SignIn();
    _phases[SigningPhase.first] = const First();
    _phases[SigningPhase.second] = const Second();
    _phases[SigningPhase.third] = const Third();
    _phases[SigningPhase.fourth] = const Fourth();
    _phases[SigningPhase.fifth] = const Fifth();
  }

  setContentSetter(Function(Widget widget) setContent) {
    _setContent = setContent;
  }

  show(SigningPhase phase) {
    _setContent!(_phases[phase]!);
  }
}

enum SigningPhase {
  signIn, first, second, third, fourth, fifth, sixth
}