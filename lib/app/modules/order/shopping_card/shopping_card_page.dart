import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burger_mobile/app/core/ui/formatter_helper.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/plus_minus_box.dart';
import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:vakinha_burger_mobile/app/modules/order/shopping_card/widgets/address_field.dart';
import 'package:vakinha_burger_mobile/app/modules/order/shopping_card/widgets/cpf_field.dart';
import './shopping_card_controller.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
  final _formKey = GlobalKey<FormState>();

  ShoppingCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constrains.maxHeight,
            minWidth: constrains.maxWidth,
          ),
          child: IntrinsicHeight(
            child: SingleChildScrollView(
              child: Obx(() {
                return Form(
                  key: _formKey,
                  child: Visibility(
                    visible: controller.products.isNotEmpty,
                    replacement: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Carrinho',
                            style: context.textTheme.headline6?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.primaryColorDark,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Nenhum item adicionado no carrinho')
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  'Carrinho',
                                  style: context.textTheme.headline6?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.primaryColorDark,
                                  ),
                                ),
                                IconButton(
                                  onPressed: controller.clear,
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              // if (controller.products.isNotEmpty)
                              ...controller.products
                                  .map((item) => Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: PlusMinusBox(
                                          label: item.product.name,
                                          calculateTotal: true,
                                          elevated: true,
                                          backgroundColor: Colors.white,
                                          quantity: item.quantity,
                                          price: item.product.price,
                                          plusCallback: () => controller
                                              .addQuantityInProduct(item),
                                          minusCallback: () => controller
                                              .subtractQuantityInProduct(item),
                                        ),
                                      ))
                                  .toList(),

                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total do pedido',
                                      style:
                                          context.textTheme.bodyText1?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      FormatterHelper.formatCurrency(
                                          controller.totalValue),
                                      style:
                                          context.textTheme.bodyText1?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(),
                              const AddressField(),
                              const Divider(),
                              const CpfField(),
                              const Divider(),
                              // const Spacer(),
                              Center(
                                child: SizedBox(
                                  width:
                                      context.widthTransformer(reducedBy: 10),
                                  child: VakinhaButtom(
                                    label: 'Finalizar',
                                    onPressed: () {
                                      final formValid =
                                          _formKey.currentState?.validate() ??
                                              false;

                                      if (formValid) {
                                        controller.createOrder();
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
