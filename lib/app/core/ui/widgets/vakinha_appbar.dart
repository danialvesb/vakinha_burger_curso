import 'package:flutter/material.dart';

class VakinhaAppbar extends AppBar {
  VakinhaAppbar({
    Key? key,
    double elevation = 2,
  }) : super(
          key: key,
          backgroundColor: Colors.white,
          elevation: elevation,
          centerTitle: true,
          title: Image.asset(
            'assets/images/db728d88-0878-4e25-9308-cc88921f628a 2.png',
            width: 80,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        );
}
