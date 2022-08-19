import 'package:campus_pay/znewproject/homeextends.dart';
import 'package:campus_pay/znewproject/homepagez.dart';
import 'package:campus_pay/znewproject/loginsetup/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

WidgetRef? globalref;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      globalref = ref;
      return MaterialApp(
        title: 'Flutter Demo',

        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          appBarTheme: const AppBarTheme(
            elevation: 0,
          ),
        ),
        // home: currentUser != null ? const Home() : Login(),
        home: const HomeE(),

        debugShowCheckedModeBanner: false,
      );
    });
  }
}
