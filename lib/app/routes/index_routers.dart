import 'package:vakinha_burger_mobile/app/routes/auth_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/home_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/product_routers.dart';
import 'package:vakinha_burger_mobile/app/routes/splash_routers.dart';

class IndexRouters {
  IndexRouters._();

  static final routers = [
    ...SplashRouters.routers,
    ...AuthRouters.routers,
    ...HomesRouters.routers,
    ...ProductRouters.routers,
  ];
}
