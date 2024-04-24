import 'package:bisa_app/src/presentation/home_screen/card_tab.dart';
import 'package:bisa_app/src/presentation/home_screen/saved_card_tab.dart';
import 'package:bisa_app/src/presentation/home_screen/widget/tabwidget.dart';
import 'package:bisa_app/src/presentation/more_screen/more_page.dart';
import 'package:bisa_app/src/presentation/profile_screen/profile_page.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../more_screen/create_card_screen/create_card_page/cubit/create_card_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CreateCardCubit>(context).getSavedCards();
    BlocProvider.of<CreateCardCubit>(context).getCards();
  }

  // void _showSnackBar(String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(behavior: SnackBarBehavior.floating, content: Text(message)));
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MorePage())),
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Image(
                    image: const AssetImage(AssetResources.appLogo),
                    color: AppTheme.backColor,
                    height: 22.h,
                    width: 59.w,
                  ),
                )),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_outlined,
                  color: AppTheme.backColor,
                  size: 24.sp,
                ),
                padding: EdgeInsets.only(right: 8.w),
              )
            ],
            backgroundColor: AppTheme.textColor,
            bottom: PreferredSize(
                preferredSize: Size.square(70.h),
                child: Column(
                  children: [
                    Container(
                      height: 59.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppTheme.backColor,
                        // color: Colors.amber,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TabBar(
                            indicator: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadiusDirectional.circular(5)),
                            unselectedLabelColor:
                                const Color.fromARGB(255, 118, 116, 116),
                            labelStyle:
                                const TextStyle(color: AppTheme.backColor),
                            dividerColor: Colors.transparent,
                            indicatorColor: Colors.transparent,
                            tabs: const [
                              TabWidget(
                                txt: 'Recent',
                              ),
                              TabWidget(txt: 'Saved'),
                              TabWidget(txt: 'Promotions')
                            ]),
                      ),
                    ),
                  ],
                )),
          ),
          body: TabBarView(
            children: <Widget>[
              CardTab(),
              SavedCardTab(),
              Container(
                color: AppTheme.backColor,
                //padding: EdgeInsets.symmetric(horizontal: 20.w),
                width: double.infinity,
                child: SingleChildScrollView(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfilePage()));
                            },
                            child: const ListTile(
                              leading: CircleAvatar(),
                              trailing: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              title: Text("Customer Name"),
                              subtitle: Text("Designation"),
                            ),
                          );
                        })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


