import 'package:vakinha_burger_mobile/app/models/product_model.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> findAll();
}
