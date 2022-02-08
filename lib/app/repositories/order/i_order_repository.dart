import 'package:vakinha_burger_mobile/app/models/order.dart';
import 'package:vakinha_burger_mobile/app/models/order_pix.dart';

abstract class IOrderRepository {
  Future<OrderPix> createOrder(Order order);
}
