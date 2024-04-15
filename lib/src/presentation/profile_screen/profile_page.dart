import 'package:bisa_app/src/presentation/full_card_view/cubit/card_view_cubit.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widget/details_text_form_field.dart';
import '../widget/pop_up_text_field.dart';

class ProfilePage extends StatefulWidget {
  final String? cardId;
  const ProfilePage({super.key, this.cardId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();
    context.read<CardViewCubit>().fetchData(widget.cardId!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardViewCubit,CardViewState>(
        builder: (context , CardViewState){
          print(CardViewState);
          if(CardViewState is CardViewLoading){
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          else if(CardViewState is CardViewLoaded) {
            final cardData = CardViewState.cardData.data();
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 0.w),
                        height: 294.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: AppTheme.backColor,
                            image: DecorationImage(
                                image: AssetImage(AssetResources.background),
                                fit: BoxFit.cover)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      size: 20.sp,
                                    )),
                                Text(
                                  "Profile",
                                  style: AppTheme.pageHead,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.share_outlined,
                                      color: AppTheme.textColor,
                                      size: 25.sp,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Container(
                              height: 80.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: AppTheme.smallText, width: 0.5.w),
                                image:  DecorationImage(
                                    image: NetworkImage(cardData?['imageUrl']),
                                    fit: BoxFit.cover),
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                 cardData?['name'],
                                  style: AppTheme.pageHead,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 20.sp,
                                )
                              ],
                            ),
                            Text(
                              cardData?['profession'],
                              style: AppTheme.smallHead,
                            ),
                            Text(
                              "Verified",
                              style: AppTheme.smallHeadGreen,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.h, horizontal: 30.w),
                              height: 75.h,
                              decoration: BoxDecoration(
                                  color: AppTheme.textColor,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () => showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: Container(
                                              height: 287.h,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w),
                                              decoration: BoxDecoration(
                                                  color: AppTheme.textColor,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(26.r),
                                                      topRight: Radius.circular(26.r))),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 35.h,
                                                  ),
                                                   PopUpTextField(
                                                    controller: TextEditingController(text: cardData?['phone']),
                                                      image: AssetImage(
                                                          AssetResources.callIcon)),
                                                  SizedBox(
                                                    height: 35.h,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.phone_outlined,
                                          color: AppTheme.backColor,
                                          size: 18.sp,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          "Mobile",
                                          style: AppTheme.buttonText,
                                        )
                                      ],
                                    ),
                                  ),
                                  const VerticalDivider(
                                    color: AppTheme.backColor,
                                  ),
                                  GestureDetector(
                                    onTap: () => showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w),
                                              height: 208.h,
                                              decoration: BoxDecoration(
                                                  color: AppTheme.textColor,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(26.r),
                                                      topRight: Radius.circular(26.r))),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 35.h,
                                                  ),
                                                  PopUpTextField(
                                                    controller: TextEditingController(text: 'email@gmail.com'),
                                                      prefix: Image(
                                                        image: AssetImage(
                                                            AssetResources.faceBook),
                                                      ),
                                                      prefixIconConstraints:
                                                      BoxConstraints(
                                                          maxWidth: 23.w,
                                                          maxHeight: 23.h),
                                                      image: AssetImage(
                                                          AssetResources.socialIcon)),

                                                  SizedBox(
                                                    height: 35.h,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.mail_outline_rounded,
                                          color: AppTheme.backColor,
                                          size: 18.sp,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          "Email",
                                          style: AppTheme.buttonText,
                                        )
                                      ],
                                    ),
                                  ),
                                  const VerticalDivider(
                                    color: AppTheme.backColor,
                                  ),
                                  GestureDetector(
                                    onTap: () => showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w),
                                              height: 208.h,
                                              decoration: BoxDecoration(
                                                  color: AppTheme.textColor,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(26.r),
                                                      topRight: Radius.circular(26.r))),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 35.h,
                                                  ),
                                                  PopUpTextField(
                                                    controller: TextEditingController(text: cardData?['website']),
                                                      prefix: Image(
                                                        image: AssetImage(
                                                            AssetResources.faceBook),
                                                      ),
                                                      prefixIconConstraints:
                                                      BoxConstraints(
                                                          maxWidth: 23.w,
                                                          maxHeight: 23.h),
                                                      image: AssetImage(
                                                          AssetResources.socialIcon)),
                                                  SizedBox(
                                                    height: 35.h,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.language_rounded,
                                          color: AppTheme.backColor,
                                          size: 18.sp,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text(
                                          "Social",
                                          style: AppTheme.buttonText,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Basic Details",
                                  style: AppTheme.tabText,
                                ),
                                SvgPicture.asset(AssetResources.editIcon)
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                             DetailsTextFormField(
                                labelText: 'Company Name',
                                controller: TextEditingController(text:  'Codignus Technology')
                            ),
                            const SizedBox(height: 10,),
                             DetailsTextFormField(
                              labelText: 'Address',
                            controller: TextEditingController(text: cardData?['address']),
                            ),
                            const SizedBox(height: 10,),
                             DetailsTextFormField(
                              labelText: 'Business Details',
                              controller:TextEditingController(text: "Trading Company",)
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                             DetailsTextFormField(
                              labelText: 'Website',
                              controller: TextEditingController(text: "www.codignus.com"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                bottomNavigationBar: Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 50.h),
                  child: const ButtonWidget(buttonTextContent: "Save"),
                ),
              ),
            );
          }else {
            return Container();
          }
        }
    );
  }
}
