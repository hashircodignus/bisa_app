import 'package:bisa_app/src/presentation/more_screen/create_card_screen/create_business_card_second_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/custom_data_textfield.dart';

class CreateBusinessCardPage extends StatelessWidget {
  CreateBusinessCardPage({super.key});
  final TextEditingController _companyNameController= TextEditingController();
  final TextEditingController _nameController= TextEditingController();
  final TextEditingController _designationController= TextEditingController();
  final TextEditingController _addressController= TextEditingController();
  final TextEditingController _businessController= TextEditingController();
  final TextEditingController _websiteController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.h,
       backgroundColor: AppTheme.backColor,
        titleSpacing:-18.w,
        leadingWidth: 60.w,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:  Icon(Icons.keyboard_arrow_left_rounded,color:AppTheme.textColor,size: 30.sp,)),
        title: Text("Create Card",style: AppTheme.pageHead,),
      ),
      body: Container(
        padding:  EdgeInsets.symmetric(horizontal: 20.w),
        color: AppTheme.backColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
               decoration: const BoxDecoration(
                 //color: Colors.red,
               ),
                child: Align(
                  alignment: const Alignment(0, -0.1),
                  child: Container(
                    height: 82.h,
                    width: 82.w,
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage(AssetResources.userDp)),
                      border: Border.all(color: AppTheme.smallText,width: 1.w),
                      borderRadius: BorderRadius.circular(100.r),
                      color: Colors.white,
                    ),

                  ),
                ),
              ),
               CustomDataTextField(prefixIcon:  Icon(Icons.apartment_outlined,color: AppTheme.textColor,size: 19.sp,), hintText: 'Company Name', controller: _companyNameController,),
              SizedBox(height: 20.h,),
               CustomDataTextField(prefixIcon: Icon( Icons.person_outline_outlined,color: AppTheme.textColor,size: 19.sp), hintText: "Full Name", controller: _nameController,),
              SizedBox(height: 20.h,),
               CustomDataTextField(prefixIcon:  Icon(Icons.account_balance_outlined,color: AppTheme.textColor,size: 19.sp), hintText: "Designation", controller: _designationController,),
              SizedBox(height: 20.h,),
               CustomDataTextField(prefixIcon: Icon( Icons.location_on_outlined,color: AppTheme.textColor,size: 19.sp), hintText: "Address", controller: _addressController,),
              SizedBox(height: 20.h,),
               CustomDataTextField(prefixIcon:  Icon(Icons.newspaper,color: AppTheme.textColor,size: 19.sp), hintText: "Business Details", controller: _businessController,),
              SizedBox(height: 20.h,),
               CustomDataTextField(prefixIcon:  Icon(Icons.language_rounded,color: AppTheme.textColor,size: 19.sp), hintText: "Website", controller: _websiteController,),
               SizedBox(height: 83.h,),
               ButtonWidget(buttonTextContent: "NEXT",onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateBusinessCardSecondPage()));
              },)
            ],
          ),
        ),

      ),
    );
  }
}

