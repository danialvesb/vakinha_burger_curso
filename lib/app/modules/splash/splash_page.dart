import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vakinha_burger_mobile/app/core/ui/widgets/vakinha_buttom.dart';
import 'package:vakinha_burger_mobile/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: VakinhaAppbar(),
      body: Container(
          color: const Color(0xFF140E0E),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: context.width,
                  child: Image.asset(
                    'assets/images/gastronomia_tt-burger_abril19_pfzstudio_ 1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: context.heightTransformer(reducedBy: 85),
                    ),
                    Image.asset(
                        'assets/images/db728d88-0878-4e25-9308-cc88921f628a 2.png'),
                    const SizedBox(
                      height: 60,
                    ),
                    VakinhaButtom(
                      label: 'ACESSAR',
                      onPressed: () => controller.checkLogged(),
                      width: context.heightTransformer(reducedBy: 60),
                      height: 35,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
