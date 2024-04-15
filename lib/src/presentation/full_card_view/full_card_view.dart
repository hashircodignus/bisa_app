import 'package:bisa_app/src/presentation/full_card_view/cubit/card_view_cubit.dart';
import 'package:bisa_app/src/presentation/widget/full_card_details_widget.dart';
import 'package:bisa_app/src/presentation/widget/subscribe_button.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FullCardView extends StatefulWidget {
  final String cardId;
  const FullCardView({Key? key,required this.cardId}) : super(key: key);

  @override
  State<FullCardView> createState() => _FullCardViewState();
}


class _FullCardViewState extends State<FullCardView> {

  @override
  void initState() {
    super.initState();
    context.read<CardViewCubit>().fetchData(widget.cardId);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardViewCubit, CardViewState>(
      builder: (context, cardViewState) {
        print(cardViewState);
        if (cardViewState is CardViewLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: AppTheme.textColor,
              ),
            ),
          );
        } else if (cardViewState is CardViewLoaded) {
          final cardData = cardViewState.cardData.data();
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 50.h),
                child: const SubscribedButton(buttonTextContent: "Subscribed"),
              ),
              backgroundColor: AppTheme.backColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 315.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetResources.background),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 40.h),
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
                                ),
                              ),
                              Text(
                                "My Card",
                                style: AppTheme.pageHead,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  AssetResources.editIcon,
                                ),
                                iconSize: 19.sp,
                              )
                            ],
                          ),
                          SizedBox(height: 25.h),
                          Container(
                            height: 80.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppTheme.smallText,
                                width: 0.5.w,
                              ),
                              image: DecorationImage(
                                image: NetworkImage(cardData?['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                cardData?['name'],
                                style: AppTheme.tabText,
                              ),
                              SizedBox(width: 4.w),
                            ],
                          ),
                          Text(
                            cardData?['profession'],
                            style: AppTheme.smallHead,
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 20.w),
                                child: Container(
                                  height: 25.h,
                                  width: 100.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(AssetResources.whatsApp),
                                      Image.asset(AssetResources.instagram),
                                      Image.asset(AssetResources.faceBook),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    FullCardDetailsScreen(
                      prefixIcon: SvgPicture.asset(
                        AssetResources.location,
                        fit: BoxFit.none,
                      ),
                      controller: TextEditingController(text: cardData?['address']),
                      labelText: "Address",
                      keyboardType: TextInputType.multiline,
                    ),
                    SizedBox(height: 20.h),
                    FullCardDetailsScreen(
                      prefixIcon: SvgPicture.asset(
                        AssetResources.website,
                        fit: BoxFit.none,
                      ),
                      labelText: "Website",
                      controller: TextEditingController(text: cardData?['website']),
                      keyboardType: TextInputType.multiline,
                    ),
                    SizedBox(height: 20.h),
                    FullCardDetailsScreen(
                      prefixIcon: SvgPicture.asset(
                        AssetResources.phone,
                        fit: BoxFit.none,
                      ),
                      labelText: "Phone Number",
                      controller: TextEditingController(text: cardData?['phone']),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20.h),
                    FullCardDetailsScreen(
                      prefixIcon: SvgPicture.asset(
                        AssetResources.email,
                        fit: BoxFit.none,
                      ),
                      labelText: "Email",
                      controller: TextEditingController(text: cardData?['email']),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.teal,
          );
        }
      },
    );
  }
}
