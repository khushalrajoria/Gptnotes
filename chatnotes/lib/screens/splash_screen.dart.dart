// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:chatnotes/controllers/splashScreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  final splashController =Get.put(SplashScreenController()); // this put will be found by Get.find

  // @override
  // State<SplashScreen> createState() => _SplashScreenState();
// }
 

// class _SplashScreenState extends State<SplashScreen> {

//   @override
//   void initState() {
//     // startAnimation();
//   }

// we created a splash screem by a tradional method now we are using GetX cause that's the future
// Check 'splash screen controller' in 'controllers'

//  Future<void> startAnimation() async {
//     await Future.delayed(Duration(milliseconds: 300));
//     setState(() {
//       animate = true;
//     });
//     await Future.delayed(Duration(milliseconds: 1500));
//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Welcome()));
//   }
  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
      
          children: [
            
            FadeInAnimation(splashController: splashController),
            Obx(
              ()=> AnimatedPositioned(
                duration: Duration(milliseconds: 600),
                bottom:splashController.animate.value ? -1:-20,
                right: splashController.animate.value ? -120: -70,
                child:Transform.rotate(
                  angle:  0.6,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(300),
                     gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 16, 121, 30), Color.fromARGB(255, 15, 141, 245)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    ),
                  ),
                )),
            ),
            Obx(
              ()=> AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                        top: 110,
                        left: splashController.animate.value ? 80 : 50,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Note',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 69,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'chat',
                                style: TextStyle(
                                  color: const Color.fromARGB(237, 0, 0, 0),
                                  fontSize: 69,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                       ),
            ),
            Obx(
              ()=> Center(
                child: AnimatedOpacity(
                duration: Duration(milliseconds: 700),
                  opacity: splashController.animate.value ? 1 : .2,
                  child: Positioned(
                    child: Image.network("https://cdn-icons-png.flaticon.com/128/10089/10089801.png")),
                ),
              ),
            ),
            Obx(
              ()=> AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                bottom:40,
                left:splashController.animate.value ? 40: 0 ,
                child: "Make your notes \nwith some help".text.xl3.color(Color.fromARGB(204, 8, 0, 0)).make()),
            ),
              
          ],
    
      ),
    );
  }
}

class FadeInAnimation extends StatelessWidget {
  const FadeInAnimation({
    super.key,
    required this.splashController,
  });

  final SplashScreenController splashController;

  @override
  Widget build(BuildContext context) {
    return Obx( //we are observing the change in RxBool's value so we wrap whatever container using them in this
      ()=> AnimatedPositioned(
        duration: Duration(milliseconds: 600),
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
