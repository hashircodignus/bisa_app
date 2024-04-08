import 'package:bisa_app/src/presentation/more_screen/create_card_screen/create_card_second_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/custom_data_textfield.dart';

class CreateCardPage extends StatelessWidget {
  CreateCardPage({super.key});
  final TextEditingController _nameController= TextEditingController();
  final TextEditingController _professionController= TextEditingController();
  final TextEditingController _addressController= TextEditingController();
  final TextEditingController _websiteController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
         backgroundColor: AppTheme.backColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.h,
         backgroundColor: Colors.transparent,
          titleSpacing:-18.w,
          leadingWidth: 60.w,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon:  Icon(Icons.keyboard_arrow_left_rounded,color:AppTheme.textColor,size: 30.sp,)),
          title: Text("Create Card",style: AppTheme.pageHead,),
          forceMaterialTransparency: true,
        ),
        body: Container(
          // padding:  EdgeInsets.symmetric(horizontal: 20.w),
          color: AppTheme.backColor,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: 250.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage(AssetResources.background),fit: BoxFit.cover)
                  ),
                  child: Align(
                    alignment: const Alignment(0, 0.5),
                    child: Container(
                      height: 82.h,
                      width: 82.w,
                      decoration: BoxDecoration(
                        image: const DecorationImage(image: AssetImage(AssetResources.userDp)),
                        border: Border.all(color: AppTheme.smallText,width: 1.w),
                        borderRadius: BorderRadius.circular(100.r),
                      ),

                    ),
                  ),
                ),
                 Container(
                   padding:  EdgeInsets.symmetric(horizontal: 20.w),
                   child: Column(
                     children: [
                      SizedBox(height: 20.h,),
                       CustomDataTextField(prefixIcon: Icon( Icons.person_outline_outlined,color: AppTheme.textColor,size: 19.sp), hintText: "Full Name", controller: _nameController, fieldHead: 'Name',),
                       SizedBox(height: 20.h,),
                        CustomDataTextField(prefixIcon:  Icon(Icons.account_balance_outlined,color: AppTheme.textColor,size: 19.sp), hintText: "Professions", controller: _professionController, fieldHead: 'Professions',),
                       SizedBox(height: 20.h,),
                        CustomDataTextField(prefixIcon: Icon( Icons.location_on_outlined,color: AppTheme.textColor,size: 19.sp), hintText: "Address", controller: _addressController, fieldHead: 'Address',),
                       SizedBox(height: 20.h,),
                        CustomDataTextField(prefixIcon:  Icon(Icons.language_rounded,color: AppTheme.textColor,size: 19.sp), hintText: "Website", controller: _websiteController, fieldHead: 'Website',),
                        SizedBox(height: 83.h,),
                     ],
                   ),
                 ),
              ],
            ),
          ),

        ),
        bottomNavigationBar: Padding(
          padding:  EdgeInsets.only(left: 20.w,right: 20.w,bottom: 50.h),
          child: ButtonWidget(buttonTextContent: "NEXT",onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateCardSecondPage()));
          },),
        ),
      ),
    );
  }
}

