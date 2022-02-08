import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/services/auth_service.dart';
import 'package:vakinha_burger_mobile/app/core/services/shopping_card_service.dart';
import 'package:vakinha_burger_mobile/app/models/order.dart';
import 'package:vakinha_burger_mobile/app/models/shopping_card_model.dart';
import 'package:vakinha_burger_mobile/app/modules/home/home_controller.dart';
import 'package:vakinha_burger_mobile/app/repositories/order/i_order_repository.dart';
import 'package:vakinha_burger_mobile/app/repositories/order/order_repository.dart';

class ShoppingCardController extends GetxController {
  final AuthService _authService;
  final ShoppingCardService _shoppingCardService;
  final IOrderRepository _orderRepository;

  ShoppingCardController({
    required AuthService authService,
    required ShoppingCardService shoppingCardService,
    required IOrderRepository orderRepository,
  })  : _authService = authService,
        _shoppingCardService = shoppingCardService,
        _orderRepository = orderRepository;

  final _address = ''.obs;
  final _cpf = ''.obs;

  List<ShoppingCardModel> get products => _shoppingCardService.products;
  double get totalValue => _shoppingCardService.totalValue;

  set address(String value) {
    _address(value);
  }

  set cpf(String value) {
    _cpf(value);
  }

  void addQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
      shoppingCardModel.product,
      quantity: shoppingCardModel.quantity + 1,
    );
  }

  void subtractQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
      shoppingCardModel.product,
      quantity: shoppingCardModel.quantity - 1,
    );
  }

  void clear() => _shoppingCardService.clear();

  Future<void> createOrder() async {
    final userId = _authService.getUserId();

    final order = Order(
      userId: userId!,
      cpf: _cpf.value,
      address: _address.value,
      items: products,
    );

    var orderPix = await _orderRepository.createOrder(order);

    orderPix = orderPix.copyWith(
      totalValue: totalValue,
    );

    clear();

    Get.offNamed('/order/finished', arguments: orderPix);
    Get.back(id: HomeController.NAVIGATOR_KEY);
  }
}
