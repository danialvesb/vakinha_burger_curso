import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger_mobile/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger_mobile/app/models/product_model.dart';
import 'package:vakinha_burger_mobile/app/repositories/products/product_repository.dart';

class MenuController extends GetxController with LoaderMixin, MessagesMixin {
  ProductRepository _productRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;

  MenuController({required ProductRepository productRepository})
      : _productRepository = productRepository;

  @override
  void onInit() {
    super.onInit();

    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();

    await _findAllProducts();
  }

  Future<void> _findAllProducts() async {
    try {
      _loading.toggle();

      final products = await _productRepository.findAll();

      _loading.toggle();

      menu.assignAll(products);
    } catch (e, s) {
      _loading.toggle();

      log('Erro ao buscar produtos', error: e, stackTrace: s);

      _message(
        MessageModel(
            title: 'Erro',
            message: 'Erro ao buscar menu',
            type: MessageType.error),
      );
    }
  }

  Future<void> refreshPage() async {
    await _findAllProducts();
  }
}
