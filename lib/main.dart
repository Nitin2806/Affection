import 'package:affection/screens/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:affection/utils/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 49, 49, 49),
      systemNavigationBarColor: Color.fromARGB(255, 67, 67, 67)));

  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBwe6MZz171vgGEhiPKvbJpDrv3kripnVY",
            appId: "1:440510448701:web:d2422b7fb4624f9cfb9654",
            messagingSenderId: "440510448701",
            projectId: "affection-a0a2f",
            storageBucket: "affection-a0a2f.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Affection',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        // home: const ResponsiveLayout(
        //   mobileScreenLayout: MobileScreenLayout(),
        //   webScreenLayout: WebScreenLayout(),
        // )
        home: const Login());
  }
}
// _8s_w_eet_sparkles_