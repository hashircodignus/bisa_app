import 'package:bisa_app/src/presentation/dashboard_screen/dashboard_page.dart';
import 'package:bisa_app/src/presentation/home_screen/home_page.dart';
import 'package:bisa_app/src/presentation/more_screen/more_page.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int selectedIndex=0;
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  final List<Widget> _list=[
    const HomePage(),
    const DashboardPage(),

  ];

  void onItemTapped(int index){
   index == 2
       ? _drawerKey.currentState!.openEndDrawer()
       : setState(() {
     selectedIndex=index;
   });

  }

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _drawerKey,
        body: Center(
          child: _list.elementAt(selectedIndex),
        ),

        endDrawer: const MorePage(),
        bottomNavigationBar:
        Container(
          height: 79.h,
          padding:  EdgeInsets.only(bottom: 20.h,left: 20.w,right: 20.w),
          decoration: const BoxDecoration(
            color: AppTheme.backColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.r),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppTheme.textColor,
              selectedLabelStyle: AppTheme.navigationText,
              unselectedLabelStyle: AppTheme.navigationTextGrey,
              elevation: 0,
              items:   <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AssetResources.homeIcon),size: 22.sp,),
                    label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AssetResources.dashboardIcon),size: 22.sp,),
                    label: "Dashboard"
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(AssetResources.moreIcon),size: 22.sp,),
                    label: "More",

                ),
              ],
              currentIndex: selectedIndex,
              showUnselectedLabels: true,
              unselectedItemColor: Colors.grey,
              selectedItemColor: AppTheme.backColor,
              onTap: onItemTapped,

            ),
          ),
        ),
      ),
    );
  }
}
