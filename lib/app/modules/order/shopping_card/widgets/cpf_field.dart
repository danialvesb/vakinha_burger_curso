import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/modules/order/shopping_card/shopping_card_controller.dart';
import 'package:validatorless/validatorless.dart';

class CpfField extends GetView<ShoppingCardController> {
  const CpfField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 35,
          child: Text(
            'CPF',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            controller.cpf = value;
          },
          validator: Validatorless.multiple([
            Validatorless.required('CPF obrigatório'),
            Validatorless.cpf('CPF')
          ]),
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Digite o CPF',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
