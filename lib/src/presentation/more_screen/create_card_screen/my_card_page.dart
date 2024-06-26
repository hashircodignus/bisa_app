import 'package:bisa_app/src/presentation/full_card_view/full_card_view.dart';
import 'package:bisa_app/src/presentation/more_screen/create_card_screen/create_card_page/create_card_page.dart';
import 'package:bisa_app/src/presentation/widget/app_bar_title_widget.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCardPage extends StatelessWidget {
  const MyCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backColor,
        automaticallyImplyLeading: false,
        title: const AppBarTitleWidget(text: "My Card"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance
                .collection('cards')
                    .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.textColor,
                      ),
                    );
                  }
                  if(snapshot.hasError){
                    return Center(child: Text(
                      'Error: ${snapshot.error}'
                    ),);
                  }
                  final docs = snapshot.data?.docs;

                  if(docs == null || docs.isEmpty){
                    return Text("No data available");
                  }

                  return Flexible(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final doc = docs[index];
                        final name = doc['name'];
                        final designation = doc['profession'];
                        final cardImageDp = doc['imageUrl'];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context)=>FullCardView(cardId: doc.id)));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 24.h),
                            height: 120.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: AppTheme.cardColor.withOpacity(0.12),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 63.h,
                                  width: 63.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: NetworkImage(cardImageDp),fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(50.r),
                                    //color: Colors.red,
                                    border: Border.all(
                                        width: 3.w, color: AppTheme.backColor),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: AppTheme.pageHead,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      designation,
                                      style: AppTheme.greenSubText,
                                    )
                                  ],
                                ),
                                Expanded(
                                    child: Align(
                                        alignment: Alignment(1, -1),
                                        child: Icon(
                                          Icons.check_circle,
                                          color: AppTheme.cardColor,
                                        )))
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 10.h),
                    ),
                  );
                }),


            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateCardPage()));
              },
              child: Container(
                height: 120.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: AppTheme.backColor,
                    border: Border.all(width: 3.w, color: AppTheme.backColor),
                    boxShadow: [
                      BoxShadow(
                          color: AppTheme.textColor.withOpacity(0.08),
                          spreadRadius: 1,
                          blurRadius: 8),
                    ]),
                child: Center(
                  child: Text(
                    "Add New Card",
                    style: AppTheme.smallTextHead,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
