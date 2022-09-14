import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_ui/core/const/colors.dart';
import 'package:flex_ui/core/services/notification_service.dart';
import 'package:flex_ui/screens/onboarding/page/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      NotificationService.flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const IOSInitializationSettings initializationSettingsIOS =
         IOSInitializationSettings();
    const InitializationSettings initializationSettings =
         InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
            
    tz.initializeTimeZones();

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Widget build(BuildContext context) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flex Fitness',
      home: isLoggedIn ? TabBarPage() : const OnboardingPage(),
    );
  }

  Future selectNotification(String? payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Payload'),
          content: Text('Payload : $payload'),
        );
      },
    );
  }
}
