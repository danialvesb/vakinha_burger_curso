import 'package:get/get.dart';

import 'package:vakinha_burger_mobile/app/repositories/products/i_product_repository.dart';
import 'package:vakinha_burger_mobile/app/repositories/products/product_repository.dart';
import './menu_controller.dart';

class MenuBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IProductRepository>(
      () => ProductRepository(restClient: Get.find()),
    );
    Get.put(
      MenuController(productRepository: Get.find()),
    );
  }
}
