import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/resources/theme.dart';
import '../more_screen/create_card_screen/create_card_page/cubit/create_card_cubit.dart';
import '../profile_screen/profile_page.dart';

class SavedCardTab extends StatefulWidget {
  const SavedCardTab({super.key});

  @override
  State<SavedCardTab> createState() => _SavedCardTabState();
}

class _SavedCardTabState extends State<SavedCardTab> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CreateCardCubit>(context).getSavedCards();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backColor,
      // padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: double.infinity,
      child: SingleChildScrollView(
          child: BlocBuilder<CreateCardCubit, CreateCardState>(
            builder: (context, state) {
              log(state.toString());
              if (state is CreateCardLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.textColor,
                  ),
                );
              }
              if (state is CreateCardSuccess) {
                log(state.savedCardModel.length.toString());
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.savedCardModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      // final doc = docs[index];
                      // final name = doc['name'];
                      // final designation = doc['profession'];
                      // final cardImageDp = doc['imageUrl'];
                      return GestureDetector(
                        onTap: () {
                          log("savedMode: ${state.savedCardModel[index].uid}");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                      savedModel:
                                      state.savedCardModel[index])));
                        },
                        child: ListTile(
                          leading: Container(
                            height: 49.h,
                            width: 49.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.r),
                                image: DecorationImage(
                                    image: NetworkImage(state.savedCardModel[index].imageUrl),
                                    fit: BoxFit.cover)),
                            //  child: Image.network(cardImageDp,fit: BoxFit.cover,),
                          ),
                          trailing: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          title: Text(state.savedCardModel[index].name),
                          subtitle: Text(
                              state.savedCardModel[index].profession),
                        ),
                      );
                    });
              }
              if (state is CreateCardError) {
                return Center(
                  child: Text(state.errorText),
                );
              }
              return SizedBox();
            },
          )

        // StreamBuilder<QuerySnapshot>(
        //   stream: FirebaseFirestore.instance.collection('saved').where('savedBy',isEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots(),
        //   builder: (BuildContext context,
        //       AsyncSnapshot<QuerySnapshot> snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(
        //         child: CircularProgressIndicator(
        //           color: AppTheme.textColor,
        //         ),
        //       );
        //     } else if (snapshot.hasError) {
        //       return Text('Error: ${snapshot.error}');
        //     }
        //     final docs = snapshot.data?.docs;
        //
        //     if(docs == null || docs.isEmpty){
        //       return Center(child: Text("No data available"));
        //     }
        //     return ListView.builder(
        //         physics: const BouncingScrollPhysics(),
        //         shrinkWrap: true,
        //         itemCount:docs.length,
        //         itemBuilder: (BuildContext context,int index) {
        //           final doc = docs[index];
        //           final name = doc['name'];
        //           final designation = doc['profession'];
        //           final cardImageDp = doc['imageUrl'];
        //           return GestureDetector(
        //             onTap: () {
        //               Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) =>
        //                           ProfilePage(cardModel: state.cardModel[index])));
        //             },
        //             child: ListTile(
        //               leading: Container(
        //                 height: 49.h,
        //                 width: 49.h,
        //                 decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(50.r),
        //                     image: DecorationImage(image: NetworkImage(cardImageDp),fit: BoxFit.cover)
        //                 ),
        //                 //  child: Image.network(cardImageDp,fit: BoxFit.cover,),
        //               ),
        //               trailing: Icon(
        //                 Icons.check_circle,
        //                 color: Colors.green,
        //               ),
        //               title: Text(name),
        //               subtitle:
        //               Text(designation),
        //             ),
        //           );
        //         });
        //   },
        // )
      ),
    );
  }
}
