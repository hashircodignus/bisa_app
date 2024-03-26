import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';

class HeadContainer extends StatelessWidget {
  final String headingText;
  final double? containerHeight;
  final double? containerWidth;
  final double? logoWidth;
  final double? logoHeight;
  final String smallTitleText;
  final ImageProvider? image;
  const HeadContainer({super.key,required this.headingText,required this.smallTitleText,this.image,this.containerWidth, this.containerHeight,this.logoHeight,this.logoWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      width: containerWidth,
      //color: Colors.red,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //SizedBox(height: MediaQuery.sizeOf(context).height*0.07),
          Container(
            width: logoWidth,
            height: logoHeight,
            decoration: BoxDecoration(
            //color: Colors.yellow,
                image:image !=null ? DecorationImage(
                  image: image!,
                ):null
            ),
          ),
           SizedBox(height: 43.h,),
          // SizedBox(height: MediaQuery.sizeOf(context).height*0.05,),
          Text(headingText,style: AppTheme.headText,),
          // SizedBox(height: MediaQuery.sizeOf(context).height*0.025,),
          SizedBox(height: 15.h,),
          Text(smallTitleText,style: AppTheme.smallHead,textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}