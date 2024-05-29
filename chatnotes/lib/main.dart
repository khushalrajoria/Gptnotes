import 'package:chatnotes/screens/splash_screen.dart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:chatnotes/screens/Home_page.dart';
import 'package:chatnotes/controllers/pallete.dart';
import 'package:get/get.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'khushal',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Pallete.whiteColor,
      ), 
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => HomePage(),
      //   '/home': (context) => HomePage(), },
      home: SplashScreen(),
      
      
    );
  }
}


// Now to add firebase to our project we first registered the project and copied some lines into the given locations in the buid gradle
// then we added some dependencies via 'flutter pub add' namely 'firebase_core','cloud_firestore' and 'google_fonts',
// then we initilized our app this way (in the 'main funtion')