import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:vakinha_burger_mobile/app/modules/order/shopping_card/shopping_card_controller.dart';
import 'package:validatorless/validatorless.dart';

class AddressField extends GetView<ShoppingCardController> {
  const AddressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 35,
          child: Text(
            'Endereço de entrega',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            controller.address = value;
          },
          validator: Validatorless.required('Endereço obrigatório'),
          decoration: const InputDecoration(
            hintText: 'Digite o endereço',
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
