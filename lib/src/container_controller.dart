import 'package:flutter/cupertino.dart';

import 'screens/fifth.dart';
import 'screens/first.dart';
import 'screens/fourth.dart';
import 'screens/second.dart';
import 'screens/signin.dart';
import 'screens/third.dart';

class Controller {

  Function(Widget widget)? setContent;

  late final SignIn _signIn;
  final Map<RegistrationStep, Widget> _registrationScreens = {};

  Controller() {
    _registrationScreens[RegistrationStep.first] = const First();
    _registrationScreens[RegistrationStep.second] = const Second();
    _registrationScreens[RegistrationStep.third] = const Third();
    _registrationScreens[RegistrationStep.fourth] = const Fourth();
    _registrationScreens[RegistrationStep.fifth] = const Fifth();
  }


}

enum RegistrationStep {
  first, second, third, fourth, fifth, sixth, seventh, eight, ninth
}