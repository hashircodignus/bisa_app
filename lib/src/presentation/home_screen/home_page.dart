import 'package:bisa_app/src/presentation/home_screen/widget/customer_name_field_widget.dart';
import 'package:bisa_app/src/presentation/more_screen/more_page.dart';
import 'package:bisa_app/src/presentation/profile_screen/profile_page.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/search_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: InkWell(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const MorePage())),
                child:  Padding(
                  padding:  EdgeInsets.only(left: 8.w),
                  child: Image(image: const AssetImage(AssetResources.appLogo),color: AppTheme.backColor,height: 22.h,width: 59.w,),
                )),
            centerTitle: false,
            actions:  [
              IconButton(onPressed: (){}, icon:  Icon(Icons.notifications,color: AppTheme.backColor,size: 24.sp,),padding: EdgeInsets.only(right: 8.w),)
            ],
            backgroundColor: AppTheme.textColor,
            bottom:  PreferredSize(preferredSize:  Size.square(150.h), child: Column(
              children: [
                Container(

                  margin:  EdgeInsets.only(bottom: 20.h,left: 20.w,right: 20.w,),
                    padding:  EdgeInsets.only(left: 20.w,right: 5.w),

                    decoration: BoxDecoration(
                      color: AppTheme.backColor,
                      borderRadius: BorderRadius.circular(20.r),),
                    child:  SearchTextField(
                      hintText: "Search Message",
                      cursorColor: AppTheme.textColor,
                      hintStyle:AppTheme.smallHead,
                      style: AppTheme.fieldText,
                      icon:   const Icon(Icons.search,color: AppTheme.textColor,),
                    )
                ),
                Container(
                  height: 59.h,
                    width: double.infinity,
                    //padding: const EdgeInsets.only(left: 10,right: 10),
                    decoration: const BoxDecoration(
                      color: AppTheme.backColor,
                      ),
                  child:  TabBar(
                    indicatorPadding:  EdgeInsets.only(left: 20.w,right: 20.w),
                    dividerColor: AppTheme.backColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: AppTheme.smallText,
                    unselectedLabelStyle: AppTheme.labelText,
                    indicatorColor: Colors.black87,
                      labelColor: AppTheme.textColor,
                      labelStyle: AppTheme.tabText,
                      tabs: const [
                        Tab(child: Text('Recent')),
                        Tab(child: Text('Saved')),
                        Tab(child: Text('Promotions')),
                      ]),

                ),
              ],
            )),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                color: AppTheme.backColor,
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                width: double.infinity,
                child:  SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20.h,),
                      const CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited',
                        checkedIcon: Icons.check_circle, profileImage: AssetImage(AssetResources.userDp),),
                      SizedBox(height: 20.h,),
                      CustomerNameField(nameText: 'Customer Name',onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfilePage())),
                        companyNameText: 'Customer Company Private Limited', profileImage: const AssetImage(AssetResources.user1Dp),
                      ),
                      SizedBox(height: 20.h,),
                      const CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited',
                        checkedIcon: Icons.check_circle, profileImage: AssetImage(AssetResources.user1Dp),),
                      SizedBox(height: 20.h,),
                      const CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited', profileImage: AssetImage(AssetResources.userDp),),
                      SizedBox(height: 20.h,),
                      const CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited',
                        checkedIcon: Icons.check_circle, profileImage: AssetImage(AssetResources.user2Dp),),
                      SizedBox(height: 20.h,),
                      const CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited', profileImage: AssetImage(AssetResources.userDp),),
                      SizedBox(height: 20.h,),
                      const CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited',
                        checkedIcon: Icons.check_circle, profileImage: AssetImage(AssetResources.user1Dp),),
                      SizedBox(height: 20.h,),
                      const CustomerNameField(nameText: 'Customer Name',
                        companyNameText: 'Customer Company Private Limited', profileImage: AssetImage(AssetResources.userDp),),
                      SizedBox(height: 20.h,),
                    ],
                  ),
                ),
              ),
              Center(child: const Text("Saved")),
              Center(child: const Text("Promotions")),
            ],
          ),
        ),
      ),
    );
  }
}




