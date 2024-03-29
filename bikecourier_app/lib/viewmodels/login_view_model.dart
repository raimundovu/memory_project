import 'package:bikecourier_app/constants/route_names.dart';
import 'package:bikecourier_app/services/authentication_service.dart';
import 'package:bikecourier_app/services/dialog_service.dart';
import 'package:bikecourier_app/services/navigation_service.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';
import 'base_model.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(ClientViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'El inicio de sesión ha fallado',
          description: 'Intenta de nuevo mas tarde'
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Inicio de sesión ha fallado',
        description: result,
      );
    }
  }

  navigateToSignUp() {
    _navigationService.navigateTo(SignUpViewRoute);
  }

  navigateToResetPassword() {
    _navigationService.navigateTo(ResetPasswordViewRoute);
  }
}