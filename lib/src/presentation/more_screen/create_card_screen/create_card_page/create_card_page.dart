import 'package:bisa_app/src/presentation/more_screen/create_card_screen/create_card_page/cubit/create_card_cubit.dart';
import 'package:bisa_app/src/presentation/more_screen/create_card_screen/create_card_second_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../widget/custom_data_textfield.dart';

class CreateCardPage extends StatelessWidget {
  CreateCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cardBloc = BlocProvider.of<CreateCardCubit>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.h,
          backgroundColor: Colors.transparent,
          titleSpacing: -18.w,
          leadingWidth: 60.w,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_arrow_left_rounded,
                color: AppTheme.textColor,
                size: 30.sp,
              )),
          title: Text(
            "Create Card",
            style: AppTheme.pageHead,
          ),
          forceMaterialTransparency: true,
        ),
        body: Container(
          // padding:  EdgeInsets.symmetric(horizontal: 20.w),
          color: AppTheme.backColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 250.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AssetResources.background),
                          fit: BoxFit.cover)),
                  child: Align(
                    alignment: const Alignment(0, 0.5),
                    child: Container(
                      height: 82.h,
                      width: 82.w,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(AssetResources.userDp)),
                        border:
                        Border.all(color: AppTheme.smallText, width: 1.w),
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomDataTextField(
                        prefixIcon: Icon(Icons.person_outline_outlined,
                            color: AppTheme.textColor, size: 19.sp),
                        hintText: "Full Name",
                        controller: cardBloc.nameController,
                        fieldHead: 'Name',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomDataTextField(
                        prefixIcon: Icon(Icons.account_balance_outlined,
                            color: AppTheme.textColor, size: 19.sp),
                        hintText: "Professions",
                        controller: cardBloc.professionController,
                        fieldHead: 'Professions',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomDataTextField(
                        prefixIcon: Icon(Icons.location_on_outlined,
                            color: AppTheme.textColor, size: 19.sp),
                        hintText: "Address",
                        controller: cardBloc.addressController,
                        fieldHead: 'Address',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomDataTextField(
                        prefixIcon: Icon(Icons.language_rounded,
                            color: AppTheme.textColor, size: 19.sp),
                        hintText: "Website",
                        controller: cardBloc.websiteController,
                        fieldHead: 'Website',
                      ),
                      SizedBox(
                        height: 83.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 50.h),
          child: ButtonWidget(
            buttonTextContent: "NEXT",
            onPressed: () {
              showDialog(context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context){
                return Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.textColor,
                  ),
                );
                  }
              );
              Future.delayed(Duration(seconds: 2),(){
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateCardSecondPage()));
              });
            },
          ),
        ),
      ),
    );
  }
}
