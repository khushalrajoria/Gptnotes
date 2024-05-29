import 'package:chatnotes/screens/welcome_screen.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController{
  static SplashScreenController get find => Get.find();

   RxBool animate =false.obs; //rxbool means that we can make the values obs~ observeable so that change in it can be reflected anywhere
    Future<void> startAnimation() async {
    await Future.delayed(Duration(milliseconds: 200));
      animate.value = true;
    await Future.delayed(Duration(milliseconds: 1200));
    Get.to(Welcome());
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Welcome()));
  }
}