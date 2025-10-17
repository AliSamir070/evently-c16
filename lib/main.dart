import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c16/core/resources/AppStyle.dart';
import 'package:evently_c16/core/resources/RoutesManager.dart';
import 'package:evently_c16/core/source/remote/PrefsManager.dart';
import 'package:evently_c16/providers/ThemeProvider.dart';
import 'package:evently_c16/ui/login/screen/login_screen.dart';
import 'package:evently_c16/ui/register/screen/register_screen.dart';
import 'package:evently_c16/ui/splash/screen/splash_screen.dart';
import 'package:evently_c16/ui/start/screen/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await PrefsManager.int();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EasyLocalization(
      supportedLocales: [
        Locale("en"),
        Locale("ar"),
      ],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      startLocale: Locale("en"),
      child:  ChangeNotifierProvider(
          create: (context) => ThemeProvider()..init(),
          child: MyApp())));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: AppStyle.lightTheme,
      darkTheme: AppStyle.darkTheme,
      themeMode: provider.mode,
      initialRoute: RoutesManager.start,
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesManager.splash:(_)=>SplashScreen(),
        RoutesManager.start:(_)=>StartScreen(),
        RoutesManager.login:(_)=>LoginScreen(),
        RoutesManager.register:(_)=>RegisterScreen()
      },
    );
  }
}

