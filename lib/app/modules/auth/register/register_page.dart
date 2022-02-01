import 'package:flutter/material.dart';

import 'package:get/utils.dart';
import 'package:vakinha_burger_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_textformfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                  Text(
                    'Preencha os campos abaixo para cirar o seu cadastro.',
                    style: context.textTheme.bodyText1?.copyWith(
                      color: context.theme.primaryColorDark,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextformfield(
                    label: 'Nome',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextformfield(
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextformfield(
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const VakinhaTextformfield(
                    label: 'Senha',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const VakinhaTextformfield(
                    label: 'Confirmar senha',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: VakinhaButtom(
                      width: context.width,
                      label: 'Cadastrar',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
