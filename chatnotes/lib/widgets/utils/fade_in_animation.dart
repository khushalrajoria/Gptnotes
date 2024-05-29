import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/splashScreen_controller.dart';

class FadeInAnimation extends StatelessWidget {
  const FadeInAnimation({
    super.key,
    required this.splashController, required this.durationInMs,
  });

  final SplashScreenController splashController;
  final int durationInMs;
  

  @override
  Widget build(BuildContext context) {
    return Obx( //we are observing the change in RxBool's value so we wrap whatever container using them in this
      ()=> AnimatedPositioned(
        duration: Duration(milliseconds: durationInMs),
        top: splashController.animate.value ? -40 :-200,
        left: splashController.animate.value ? -70 : -100,
        child:Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(300),
           gradient: LinearGradient(
            colors: [Color.fromARGB(255, 44, 223, 223), Color.fromARGB(255, 5, 161, 89)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          ),
        )),
    );
  }
}
