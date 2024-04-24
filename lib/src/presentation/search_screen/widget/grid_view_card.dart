// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../utils/resources/theme.dart';
//
// class GridViewCard extends StatelessWidget {
//   final String title;
//   final Widget subtitle;
//   final void Function()? onTap;
//   const GridViewCard({required this.subtitle, required this.title, super.key,this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding:  EdgeInsets.symmetric(horizontal: 20.h,vertical: 15.w),
//         decoration: BoxDecoration(
//             color: AppTheme.textColor,
//             borderRadius: BorderRadius.circular(8.r)
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(title,style: AppTheme.buttonText),
//             SizedBox(height: 13.h,),
//             subtitle
//           ],
//         ),
//       ),
//     );
//   }
// }