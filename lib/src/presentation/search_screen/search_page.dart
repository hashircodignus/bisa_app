import 'package:bisa_app/src/presentation/profile_screen/profile_page.dart';
import 'package:bisa_app/src/presentation/widget/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppTheme.backColor,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.square(30.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                  height: 60.h,
                 
                  decoration: BoxDecoration(
                   borderRadius: BorderRadiusDirectional.circular(30.r),
                      color: Colors.black),
                  child: SearchTextField(
                    hintText: "Search Message",
                    cursorColor: AppTheme.smallText,
                    hintStyle: AppTheme.smallHead,
                    icon: const Icon(
                      Icons.search,
                      color: AppTheme.backColor,
                    ),
                    style: AppTheme.smallHeadWhite,
                  )),
            )),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 648.h,
            child: ListView.builder(
              // padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()));
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
                }),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Clear History",
            style: AppTheme.smallHead,
          )
        ],
      )),
    );
  }
}
