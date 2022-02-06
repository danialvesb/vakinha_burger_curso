import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_state.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:vakinha_burger_mobile/app/modules/auth/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends VakinhaState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailEc = TextEditingController();
  final _passwordEc = TextEditingController();

  @override
  void dispose() {
    _emailEc.dispose();
    _passwordEc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: context.textTheme.headline6?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColorDark,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        VakinhaTextformfield(
                          label: 'Email',
                          controller: _emailEc,
                          validator: Validatorless.multiple([
                            Validatorless.required('E-mail obrigatorio'),
                            Validatorless.email('Email inválido')
                          ]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        VakinhaTextformfield(
                          label: 'Senha',
                          obscureText: true,
                          controller: _passwordEc,
                          validator: Validatorless.multiple([
                            Validatorless.required('Senha obrigatorio'),
                            Validatorless.min(
                                6, 'Senha deve ter pelo menos 6 caracteres')
                          ]),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: VakinhaButtom(
                            width: context.width,
                            label: 'Entrar',
                            onPressed: () {
                              final formValid =
                                  _formKey.currentState?.validate() ?? false;

                              if (formValid) {
                                controller.login(
                                  email: _emailEc.text,
                                  password: _passwordEc.text,
                                );
                              }
                            },
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Não possui conta?'),
                            TextButton(
                              onPressed: () => Get.toNamed('/auth/register'),
                              child: const Text('Cadatre-se',
                                  style: VakinhaUI.textBold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
