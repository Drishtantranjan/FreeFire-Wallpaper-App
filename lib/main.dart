import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freefire_wallpaper/splashScreen.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'Characters/andrew.dart';
import 'Characters/antonio.dart';
import 'Characters/caroline.dart';
import 'Characters/hayato.dart';
import 'Characters/kla.dart';
import 'Characters/laura.dart';
import 'Characters/maxim.dart';
import 'Characters/moco.dart';
import 'Characters/paloma.dart';
import 'Characters/rafael.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UnityAds.init(
    gameId: '5329289',
    // ignore: avoid_print
    onComplete: () => print('Initialization Complete'),
    onFailed: (error, message) =>
        // ignore: avoid_print
        print('Initialization Failed: $error $message'),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreenPage(),
        '/andrew': (context) => const Andrew(),
        '/antonio': (context) => const Antonio(),
        '/caroline': (context) => const Caroline(),
        '/hayato': (context) => const Hayato(),
        '/kla': (context) => const Kla(),
        '/laura': (context) => const Laura(),
        '/maxim': (context) => const Maxim(),
        '/moco': (context) => const Moco(),
        '/paloma': (context) => const Paloma(),
        '/rafael': (context) => const Rafael(),
        // Add other routes here
      },
    );
  }
}
