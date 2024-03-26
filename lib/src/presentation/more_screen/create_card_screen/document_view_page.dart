import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/resources/theme.dart';

class DocumentViewPage extends StatelessWidget {
  final XFile? image;
  const DocumentViewPage({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.backColor,
        titleSpacing:-15,
        leadingWidth: 60,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.keyboard_arrow_left_rounded,color:AppTheme.textColor,size: 30,)),
        title: Text("View Document",style: AppTheme.pageHead,),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outlined,color: AppTheme.textColor,))
        ],
      ),
      body:
          image != null ?
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppTheme.backColor,
        ),
       child: Image.file(File(image!.path))
      ):
              Container(),
    );
  }
}
