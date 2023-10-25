import 'package:flutter/material.dart';
import 'package:health_hub/providers/authentication/login_provider.dart';
import 'package:health_hub/providers/authentication/signup_provider.dart';
import 'package:health_hub/providers/prefs/preferences.dart';
import 'package:health_hub/providers/tests/lab_tests_provider.dart';
import 'package:health_hub/screen/authentication/login.dart';
import 'package:health_hub/screen/home.dart';
import 'package:health_hub/screen/home/deliver_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => PreferencesProvider()),
        ChangeNotifierProxyProvider<PreferencesProvider, LoginProvider>(
          create: (context) =>
              LoginProvider(Provider.of<PreferencesProvider>(context, listen: false)),
          update: (context, P, L) =>
              LoginProvider(Provider.of<PreferencesProvider>(context, listen: false)),
        ),
        ChangeNotifierProvider(create: (_) => GetLabTestProvider()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  DeliverPage()
      ),
    );
  }
}
