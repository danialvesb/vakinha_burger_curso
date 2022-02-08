import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/repositories/order/i_order_repository.dart';

import 'package:vakinha_burger_mobile/app/repositories/order/order_repository.dart';
import './shopping_card_controller.dart';

class ShoppingCardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IOrderRepository>(
      () => OrderRepository(restClient: Get.find()),
    );
    Get.put(
      ShoppingCardController(
          authService: Get.find(),
          shoppingCardService: Get.find(),
          orderRepository: Get.find()),
    );
  }
}
