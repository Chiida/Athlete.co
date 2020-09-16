import 'package:attt/utils/appleSignInAvailable/AppleSignInAvailable.dart';
import 'package:attt/utils/text.dart';
import 'package:attt/view/chewieVideo/widgets/stopwatch.dart';
import 'package:attt/view/home/pages/splashScreen.dart';
import 'package:attt/view_model/authservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  final timerService = TimerService();
  InAppPurchaseConnection.enablePendingPurchases();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final appleSignInAvailable = await AppleSignInAvailable.check();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(Provider<AppleSignInAvailable>.value(
      value: appleSignInAvailable,
      child: TimerServiceProvider(
          // provide timer service to all widgets of your app
          service: timerService,
          child: Athlete()),
    ));
  });
}

class Athlete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthService>(
        create: (_) => AuthService(),
        child: MaterialApp(
          title: MyText().mainTitle,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: CustomSplashScreen(),
        ));
  }
}
