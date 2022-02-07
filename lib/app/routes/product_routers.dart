import 'package:get/route_manager.dart';

import 'package:vakinha_burger_mobile/app/modules/product_detail/product_detail_bindings.dart';
import 'package:vakinha_burger_mobile/app/modules/product_detail/product_detail_page.dart';

class ProductRouters {
  ProductRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/product_detail',
      binding: ProductDetailBindings(),
      page: () => const ProductDetailPage(),
    ),
  ];
}
