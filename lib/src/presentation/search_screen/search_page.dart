import 'dart:async';

import 'package:bisa_app/src/presentation/profile_screen/profile_page.dart';
import 'package:bisa_app/src/presentation/widget/search_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  Stream<QuerySnapshot>? _searchResultsStream;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      setState(() {
        _searchResultsStream = FirebaseFirestore.instance
            .collection('cards')
            .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots();
      });
    } else {
      setState(() {
        _searchResultsStream = null;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backColor,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.square(30.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(30.r),
                      color: Colors.black),
                  child: SearchTextField(
                    controller: _searchController,
                    hintText: "Search Message",
                    cursorColor: AppTheme.smallText,
                    hintStyle: AppTheme.smallHead,
                    icon: const Icon(
                      Icons.search,
                      color: AppTheme.backColor,
                    ),
                    style: AppTheme.smallHeadWhite,
                  )),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 648.h,
              child: Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: _searchResultsStream,
                    builder: (context, snapshot) {
                      if (_searchController.text.isEmpty) {
                        return Container();
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(
                            color: AppTheme.textColor);
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }

                      final docs = snapshot.data?.docs ?? [];
                      if (docs.isEmpty) {
                        return Center(
                          child: Text("No data available"),
                        );
                      }

                      final lowercaseQuery =
                          _searchController.text.trim().toLowerCase();

                      final filteredDocs = docs.where((doc) {
                        final name =
                            (doc.data() as Map<String, dynamic>)['name']
                                .toLowerCase();

                        return name.contains(lowercaseQuery);
                      }).toList();

                      if (filteredDocs.isEmpty) {
                        return Center(child: Text("No data available"));
                      }

                      return Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: filteredDocs.length,
                          itemBuilder: (context, index) {
                            final doc = filteredDocs[index];
                            final name = doc['name'];
                            final designation = doc['profession'];
                            final cardImageDp = doc['imageUrl'];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProfilePage(cardId: doc.id),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: Container(
                                  height: 49.h,
                                  width: 49.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.r),
                                    image: DecorationImage(
                                      image: NetworkImage(cardImageDp),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                                title: Text(name),
                                subtitle: Text(designation),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                "Clear History",
                style: AppTheme.smallHead,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
