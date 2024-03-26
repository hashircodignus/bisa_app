import 'package:bisa_app/src/presentation/widget/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return  ScreenUtilInit(
      builder:(_ , child) {
        return MaterialApp(
        theme: ThemeData(
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Colors.transparent
          )
        ),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: const AuthPage(),
      );
      },designSize:const Size(430, 932),
    );
  }
}
