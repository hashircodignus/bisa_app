import 'package:bisa_app/src/presentation/full_card_view/full_card_view.dart';
import 'package:bisa_app/src/presentation/home_screen/bottom_nav_bar.dart';
import 'package:bisa_app/src/presentation/more_screen/create_card_screen/create_card_page/cubit/create_card_cubit.dart';
import 'package:bisa_app/src/presentation/more_screen/create_card_screen/create_card_second_page.dart';
import 'package:bisa_app/src/presentation/otp_screen/cubit/otp_page_cubit.dart';
import 'package:bisa_app/src/presentation/register_screen/cubit/register_page_cubit.dart';
import 'package:bisa_app/src/presentation/select_country_screen/cubit/selected_country_cubit.dart';
import 'package:bisa_app/src/presentation/widget/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

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
            BlocProvider(create: (context)=> RegisterPageCubit()),
            BlocProvider(create: (context)=> OtpPageCubit()),
            BlocProvider(create: (context)=> CreateCardCubit()),
          ],
          child: MaterialApp(
            theme: ThemeData(
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: Colors.black,
                selectionColor: Colors.black,
                selectionHandleColor: Colors.black,
              )
            ),
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home:CreateCardSecondPage()
          ),
        );
      },
      designSize: const Size(430, 932),
    );
  }
}