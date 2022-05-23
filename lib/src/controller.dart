import 'package:flutter/cupertino.dart';
import 'package:swipest_signing/src/screens/gender_6.dart';
import 'package:swipest_signing/src/util/data_collector.dart';

import 'screens/email_5.dart';
import 'screens/name_1.dart';
import 'screens/password_4.dart';
import 'screens/birthday_2.dart';
import 'screens/signin.dart';
import 'screens/username_3.dart';

class Controller {

  DataCollector dataCollector = DataCollector();
  Function(Widget widget)? _setContent;

  final Map<SigningPhase, Widget> _phases = {};

  Controller() {
    _phases[SigningPhase.signIn] = SignIn(this);
    _phases[SigningPhase.first] = Name1Step(this);
    _phases[SigningPhase.second] = Birthday2Step(this);
    _phases[SigningPhase.third] = Username3Step(this);
    _phases[SigningPhase.fourth] = Password4Step(this);
    _phases[SigningPhase.fifth] = Email5Step(this);
    _phases[SigningPhase.sixth] = Gender6Step(this);
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