import 'package:bisa_app/src/presentation/home_screen/bottom_nav_bar.dart';
import 'package:bisa_app/src/presentation/select_country_screen/cubit/selected_country_cubit.dart';
import 'package:bisa_app/src/presentation/select_country_screen/view/select_country_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
// void sharedpreference() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var phoneNumber = prefs.getString('phoneNumber');
//   runApp(MyApp(isLoggedIn: phoneNumber != null));
// }
class MyApp extends StatelessWidget {
 // final bool? isLoggedIn;
  const MyApp({super.key, });

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
            BlocProvider(create: (context)=> RegisterPageCubit()),
            BlocProvider(create: (context)=> OtpPageCubit()),
          ],
          child:  const MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home:  SelectCountryPage(),
           ),
        );
      },
      designSize: const Size(430, 932),
    );
  }
}