import 'package:bisa_app/src/presentation/more_screen/subscription/subscribe_page.dart';
import 'package:bisa_app/src/presentation/register_screen/cubit/register_page_cubit.dart';
import 'package:bisa_app/src/presentation/widget/custom_data_textfield.dart';
import 'package:bisa_app/src/presentation/widget/search_text_field.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/resources/theme.dart';
import '../../widget/app_bar_title_widget.dart';
import '../widget/card_details_container_widget.dart';

class CreateCardSecondPage extends StatefulWidget {
  const CreateCardSecondPage({super.key});


  @override
  State<CreateCardSecondPage> createState() => _CreateCardSecondPageState();
}

class _CreateCardSecondPageState extends State<CreateCardSecondPage> {
  List<TextEditingController> listController = [TextEditingController()];
  List<TextEditingController> listControllerEmail = [TextEditingController()];
  List<TextEditingController> listControllerSocialMedia = [TextEditingController()];
  List<AssetImage?> selectedImages = [null];
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _phoneController.text = BlocProvider.of<RegisterPageCubit>(context).phoneNumber;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
               resizeToAvoidBottomInset: true,
        backgroundColor: AppTheme.backColor,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          elevation: 0.h,
          backgroundColor: AppTheme.backColor,
          title: AppBarTitleWidget(text: "Create Card"),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          color: AppTheme.backColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CardDetailsContainer(
                    // height: 202.h,
                    cardHead: 'Phone Number',
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: listController.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: CustomDataTextField(
                                    controller: listController[index],
                                    hintText: "Phone Number",
                                    prefixIcon:
                                        const Icon(Icons.phone_outlined),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              listController.add(TextEditingController());
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            height: 40.h,
                            width: 109.w,
                            decoration: BoxDecoration(
                                color: AppTheme.cardColor,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Center(
                              child: Row(
                                children: [
                                  Text(
                                    "Add New",
                                    style: AppTheme.smallHeadWhite,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: AppTheme.backColor,
                                    size: 20.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20.h,),
                CardDetailsContainer(
                    cardHead: "Email address",
                    // height: 132.h,
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          child: ListView.builder(
                              itemCount: listControllerEmail.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: CustomDataTextField(
                                    controller: listControllerEmail[index],
                                    hintText: "Email Address",
                                    prefixIcon: Icon(
                                      Icons.mail_outline,
                                      size: 19.sp,
                                    ),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              listControllerEmail.add(TextEditingController());
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            height: 40.h,
                            width: 109.w,
                            decoration: BoxDecoration(
                                color: AppTheme.cardColor,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Center(
                              child: Row(
                                children: [
                                  Text(
                                    "Add New",
                                    style: AppTheme.smallHeadWhite,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: AppTheme.backColor,
                                    size: 20.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),

                SizedBox(
                  height: 20.h,
                ),
                CardDetailsContainer(
                    // height: 207.h,
                    cardHead: "Social media",
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: listControllerSocialMedia.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CustomDataTextField(
                                  controller: listControllerSocialMedia[index],
                                  onTap: () =>
                                   showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w),
                                            height: 200.h,
                                            decoration: BoxDecoration(
                                                color: AppTheme.backColor,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(26.r),
                                                    topRight:
                                                        Radius.circular(26.r))),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    top: 35.h,
                                                  ),
                                                  padding: EdgeInsets.only(
                                                      left: 20.w, right: 5.w),
                                                  decoration: BoxDecoration(
                                                    color: AppTheme.textColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60.r),
                                                  ),
                                                  child: SearchTextField(
                                                    cursorColor:
                                                        AppTheme.backColor,
                                                    hintText: "Search Icons",
                                                    style:
                                                        AppTheme.smallHeadWhite,
                                                    hintStyle:
                                                        AppTheme.smallHeadWhite,
                                                    icon: const Icon(
                                                      Icons.search,
                                                      color: AppTheme.backColor,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedImages[
                                                                  index] =
                                                              const AssetImage(
                                                                  AssetResources
                                                                      .faceBook);
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                          height: 52.h,
                                                          width: 52.w,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100
                                                                              .r),
                                                              image: const DecorationImage(
                                                                  image: AssetImage(
                                                                      AssetResources
                                                                          .faceBook),
                                                                  fit: BoxFit
                                                                      .cover))),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedImages[
                                                                  index] =
                                                              const AssetImage(
                                                                  AssetResources
                                                                      .instagram);
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        height: 52.h,
                                                        width: 52.w,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.r),
                                                            image: const DecorationImage(
                                                                image: AssetImage(
                                                                    AssetResources
                                                                        .instagram),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedImages[
                                                                  index] =
                                                              const AssetImage(
                                                                  AssetResources
                                                                      .whatsApp);
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        height: 52.h,
                                                        width: 52.w,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.r),
                                                            image: const DecorationImage(
                                                                image: AssetImage(
                                                                    AssetResources
                                                                        .whatsApp),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedImages[
                                                                  index] =
                                                              const AssetImage(
                                                                  AssetResources
                                                                      .behance);
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        height: 52.h,
                                                        width: 52.h,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.r),
                                                            image: const DecorationImage(
                                                                image: AssetImage(
                                                                    AssetResources
                                                                        .behance),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedImages[
                                                                  index] =
                                                              const AssetImage(
                                                                  AssetResources
                                                                      .twitter);
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        height: 52.h,
                                                        width: 52.w,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.r),
                                                            image: const DecorationImage(
                                                                image: AssetImage(
                                                                    AssetResources
                                                                        .twitter),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedImages[
                                                                  index] =
                                                              const AssetImage(
                                                                  AssetResources
                                                                      .linkedIn);
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        height: 52.h,
                                                        width: 52.w,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100.r),
                                                            image: const DecorationImage(
                                                                image: AssetImage(
                                                                    AssetResources
                                                                        .linkedIn),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                  prefixIconConstraints: BoxConstraints(
                                      maxWidth: 50.w, maxHeight: 50.h),
                                  prefixIcon: Center(
                                    child: Container(
                                        height: 30.h,
                                        width: 30.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.r),
                                            image: selectedImages[index] != null
                                                ? DecorationImage(
                                                    image:
                                                        selectedImages[index]!,
                                                    fit: BoxFit.cover)
                                                : null)),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              listControllerSocialMedia
                                  .add(TextEditingController());
                              selectedImages.add(null);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            height: 40.h,
                            width: 109.w,
                            decoration: BoxDecoration(
                                color: AppTheme.cardColor,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Center(
                              child: Row(
                                children: [
                                  Text(
                                    "Add New",
                                    style: AppTheme.smallHeadWhite,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: AppTheme.backColor,
                                    size: 20.sp,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 20.h),
          height: 90.h,
          color: AppTheme.backColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 59.h,
                    width: 185.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: AppTheme.backColor,
                        border: Border.all(
                            width: 0.5.sp, color: AppTheme.textColor)),
                    child: Center(
                        child: Text(
                      "Back",
                      style: AppTheme.fieldText,
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {
                   showDialog(context: context,
                       barrierDismissible: false,
                       builder: (BuildContext context){
                     return Center(
                       child: CircularProgressIndicator(color: AppTheme.textColor,),
                     );
                       }
                   );
                   Future.delayed(Duration(seconds: 2),(){
                     Navigator.pop(context);
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) => const SubscribePage()));
                   });
                  },
                  child: Container(
                    height: 59.h,
                    width: 185.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: AppTheme.textColor),
                    child: Center(
                        child: Text(
                      "Next",
                      style: AppTheme.buttonText,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
    ),
      );
  }
}


