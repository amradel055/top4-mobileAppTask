import 'package:flutter/material.dart';
import 'package:fullmark_task/providers/auth_provider.dart';
import 'package:fullmark_task/providers/data_handler_provider.dart';
import 'package:fullmark_task/providers/local_database.dart';
import 'package:fullmark_task/providers/screen_providers/home_provider.dart';
import 'package:fullmark_task/screens/splash.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kDebugMode) {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //   print("Print only in debug mode");
  // }

  // IsolateNameServer.registerPortWithName(
  //   port.sendPort,
  //   isolateName,
  // );
  // AndroidAlarmManager.initialize();
  // await Firebase.initializeApp();
  //
  // if (shouldUseFirestoreEmulator) {
  //   FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  // }
  // // await ScreenProtector.protectDataLeakageOn();
  //
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!.createNotificationChannel(channel);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => DataHandler()),
      ChangeNotifierProvider(create: (_) => LocalDatabase()),
      ChangeNotifierProvider(create: (_) => HomeProvider()),

    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top 4',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UpgradeAlert(child: const SplashScreen()),
    );
  }
}
