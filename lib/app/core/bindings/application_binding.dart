import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger_mobile/app/core/services/shopping_card_service.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      //Não é destruido ao sair do state é mantido em todas a aplicação
      fenix: true,
    );
    Get.lazyPut(
      () => ShoppingCardService(),
      //Não precisa do fenix, pois o service por padrão nunca morre na aplicação
      // fenix: true,
    );
  }
}
