import 'package:bikecourier_app/viewmodels/login_page_model.dart';
import 'package:bikecourier_app/shared/ui_helpers.dart';
import 'package:bikecourier_app/widgets/busy_button.dart';
import 'package:bikecourier_app/widgets/input_field.dart';
import 'package:bikecourier_app/widgets/text_link.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginPageModel>.withConsumer(
        viewModel: LoginPageModel(),
        builder: (context, model, chilld) => Scaffold(
            backgroundColor: Color.fromRGBO(255, 251, 193, 1.0),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 150,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  InputField(
                    placeholder: 'Correo',
                    controller: emailController,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Contraseña',
                    password: true,
                    controller: passwordController,
                  ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BusyButton(
                        title: 'Ingresar',
                        busy: model.busy,
                        onPressed: () {
                          model.login(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        },
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  TextLink(
                    'Crear una cuenta.',
                    onPressed: () {
                      model.navigateToSignUp();
                    },
                  )
                ],
              ),
            )));
  }
}
