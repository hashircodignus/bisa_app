import 'dart:developer';
import 'package:bisa_app/src/presentation/full_card_view/cubit/card_view_cubit.dart';
import 'package:bisa_app/src/presentation/more_screen/create_card_screen/create_card_page/cubit/create_card_cubit.dart';
import 'package:bisa_app/src/presentation/more_screen/create_card_screen/model/saved_model.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../more_screen/create_card_screen/model/card_model.dart';
import '../widget/details_text_form_field.dart';

class ProfilePage extends StatefulWidget {
  final CardModel? cardModel;
  final SavedCardModel? savedModel;
  const ProfilePage({super.key, this.cardModel, this.savedModel});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showButton = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CardViewCubit>(context).fetchData(widget.cardModel!.cardId);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating, content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardViewCubit, CardViewState>(builder: (context, state) {
      log(state.toString());
      if (state is CardViewLoading) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: AppTheme.textColor,
            ),
          ),
        );
      } else if (state is CardViewLoaded) {
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
                            border: Border.all(
                                color: AppTheme.smallText, width: 0.5.w),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.cardModel?.imageUrl ?? ''),
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
                              widget.cardModel?.name ?? '',
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
                                              horizontal: 20.w, vertical: 30.h),
                                          decoration: BoxDecoration(
                                              color: AppTheme.textColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(26.r),
                                                  topRight:
                                                      Radius.circular(26.r))),
                                          child: ListView.builder(
                                            itemCount:
                                                widget.cardModel?.phone != null
                                                    ? widget
                                                        .cardModel?.phone.length
                                                    : 0,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      widget.cardModel
                                                          ?.phone[index],
                                                      style:
                                                          AppTheme.buttonText,
                                                    ),
                                                    Container(
                                                      height: 23.h,
                                                      width: 23.w,
                                                      decoration: BoxDecoration(
                                                          color: AppTheme
                                                              .cardColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.r)),
                                                      child: Icon(
                                                        Icons
                                                            .local_phone_outlined,
                                                        color:
                                                            AppTheme.backColor,
                                                        size: 18.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
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
                                            height: 287.h,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.w,
                                                vertical: 30.h),
                                            decoration: BoxDecoration(
                                                color: AppTheme.textColor,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(26.r),
                                                    topRight:
                                                        Radius.circular(26.r))),
                                            child: ListView.builder(
                                              itemCount:
                                                  widget.cardModel?.email !=
                                                          null
                                                      ? widget.cardModel?.email
                                                          .length
                                                      : 0,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 15.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        widget.cardModel
                                                            ?.email[index],
                                                        style:
                                                            AppTheme.buttonText,
                                                      ),
                                                      Container(
                                                          height: 23.h,
                                                          width: 23.w,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.r),
                                                              color: AppTheme
                                                                  .pinkColor),
                                                          child:
                                                              SvgPicture.asset(
                                                            AssetResources
                                                                .email,
                                                            color: AppTheme
                                                                .backColor,
                                                          )),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ));
                                    }),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.email_outlined,
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
                                          height: 287.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 30.h),
                                          decoration: BoxDecoration(
                                              color: AppTheme.textColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(26.r),
                                                  topRight:
                                                      Radius.circular(26.r))),
                                          child: ListView.builder(
                                            itemCount:
                                                widget.cardModel?.social != null
                                                    ? widget.cardModel?.social
                                                        .length
                                                    : 0,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .language_rounded,
                                                          color: AppTheme
                                                              .backColor,
                                                          size: 18.sp,
                                                        ),
                                                        SizedBox(
                                                          width: 20.w,
                                                        ),
                                                        Text(
                                                          widget.cardModel
                                                              ?.social[index],
                                                          style: AppTheme
                                                              .buttonText,
                                                        ),
                                                      ],
                                                    ),
                                                    Icon(
                                                      Icons.send_outlined,
                                                      color: AppTheme.backColor,
                                                      size: 18.sp,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
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
                          labelText: 'Address',
                          controller: TextEditingController(
                              text: widget.cardModel?.address),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DetailsTextFormField(
                          labelText: 'Profession',
                          controller: TextEditingController(
                              text: widget.cardModel?.profession),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DetailsTextFormField(
                          labelText: 'Website',
                          controller: TextEditingController(
                              text: widget.cardModel?.website),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 50.h),
                child: BlocListener<CreateCardCubit, CreateCardState>(
                  listener:
                      (BuildContext context, CreateCardState state) async {
                    if (state is CreateCardLoading) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppTheme.textColor,
                            ),
                          );
                        },
                      );
                    }
                    if (state is CreateCardLoaded) {
                      _showSnackBar('Card saved!');
                    }
                    if (state is CreateCardError) {
                      _showSnackBar(state.errorText);
                    }
                  },
                  child: ButtonWidget(
                    buttonTextContent: "Save",
                    onPressed: () async {
                      final isSaved = await context
                          .read<CreateCardCubit>()
                          .isCardSaved(widget.cardModel!.cardId);
                      if (!isSaved) {
                        // context.read<CreateCardCubit>().saveCard(cardData);
                      } else {
                        _showSnackBar('Card already Saved!');
                      }
                    },
                  ),
                )),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
