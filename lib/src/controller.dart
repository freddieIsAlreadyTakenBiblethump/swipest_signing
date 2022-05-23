import 'package:flutter/cupertino.dart';
import 'package:swipest_signing/src/screens/sixth.dart';
import 'package:swipest_signing/src/util/data_collector.dart';

import 'screens/fifth.dart';
import 'screens/first.dart';
import 'screens/fourth.dart';
import 'screens/second.dart';
import 'screens/signin.dart';
import 'screens/third.dart';

class Controller {

  DataCollector dataCollector = DataCollector();
  Function(Widget widget)? _setContent;

  final Map<SigningPhase, Widget> _phases = {};

  Controller() {
    _phases[SigningPhase.signIn] = SignIn(this);
    _phases[SigningPhase.first] = First(this);
    _phases[SigningPhase.second] = Second(this);
    _phases[SigningPhase.third] = Third(this);
    _phases[SigningPhase.fourth] = Fourth(this);
    _phases[SigningPhase.fifth] = Fifth(this);
    _phases[SigningPhase.sixth] = Sixth(this);
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