import 'package:bisa_app/firebase_options.dart';
import 'package:bisa_app/src/presentation/select_country_screen/cubit/selected_country_cubit.dart';
import 'package:bisa_app/src/presentation/select_country_screen/view/select_country_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ScreenUtilInit(
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => SelectedCountryCubit()),
          ],
          child: const MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home: SelectCountryPage(),
          ),
        );
      },
      designSize: const Size(430, 932),
    );
  }
}
