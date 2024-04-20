// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:bisa_app/src/presentation/profile_screen/profile_page.dart';

// Widget buildCardListTile(BuildContext context, DocumentSnapshot doc) {
//   final name = doc['name'];
//   final designation = doc['profession'];
//   final cardImageDp = doc['imageUrl'];

//   return GestureDetector(
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ProfilePage(cardId: doc.id),
//         ),
//       );
//     },
//     child: ListTile(
//       leading: Container(
//         height: 49.h,
//         width: 49.h,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(50.r),
//           image: DecorationImage(
//             image: NetworkImage(cardImageDp),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       trailing: Icon(
//         Icons.check_circle,
//         color: Colors.green,
//       ),
//       title: Text(name),
//       subtitle: Text(designation),
//     ),
//   );
// }
