import 'package:bisa_app/src/presentation/widget/app_bar_title_widget.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/presentation/widget/light_button_widget.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/resources/asset_resources.dart';
import '../more_screen/create_card_screen/document_view_page.dart';

class KYCCreatePage extends StatefulWidget {
  const KYCCreatePage({super.key});

  @override
  State<KYCCreatePage> createState() => _KYCCreatePageState();
}

class _KYCCreatePageState extends State<KYCCreatePage> {
  String? _selectedDocument;
  XFile? _image;

  void _pickImage() async {
    final picker = ImagePicker();

    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.only(left: 30, right: 20),
            decoration: const BoxDecoration(
                color: AppTheme.backColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(26),
                    topLeft: Radius.circular(26))),
            height: 130,
            child: Row(
              children: [
                //Text("Select Image Source",style: AppTheme.buttonText,),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _getImage(ImageSource.camera);
                  },
                  child: Container(
                    height: 78,
                    width: 58,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AssetResources.camera),
                            alignment: Alignment.topCenter)),
                    child: Align(
                        alignment: const Alignment(0, 1),
                        child: Text(
                          "Camera",
                          style: AppTheme.optionsText,
                        )),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _getImage(ImageSource.gallery);
                  },
                  child: Container(
                    height: 78,
                    width: 58,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AssetResources.gallery),
                            alignment: Alignment.topCenter)),
                    child: Align(
                        alignment: const Alignment(0, 1),
                        child: Text(
                          "Gallery",
                          style: AppTheme.optionsText,
                        )),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    //  _getImage(ImageSource);
                  },
                  child: Container(
                    height: 78,
                    width: 58,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AssetResources.document),
                            alignment: Alignment.topCenter)),
                    child: Align(
                        alignment: const Alignment(0, 1),
                        child: Text(
                          "Document",
                          style: AppTheme.optionsText,
                        )),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        //  _image = XFile(pickedImage.name);
        _image = XFile(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBarTitleWidget(text: "KYC Create"),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Skip",
                style: AppTheme.tabText2,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        height: double.infinity,
        color: AppTheme.backColor,
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              height: 59.h,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5.w, color: AppTheme.smallText),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      dropdownColor: AppTheme.backColor,
                      style: AppTheme.fieldText,
                      elevation: 1,
                      isExpanded: true,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppTheme.smallText,
                        size: 30,
                      ),
                      hint: Row(
                        children: [
                          const Icon(Icons.receipt_long_outlined),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text("Choose Document")
                        ],
                      ),
                      underline: Container(),
                      value: _selectedDocument,
                      items: [
                        DropdownMenuItem<String>(
                          value: "Aadhar Card",
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const Text("Aadhar Card")
                            ],
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "Pan Card",
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const Text("Pan Card")
                            ],
                          ),
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          _selectedDocument = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            if (_selectedDocument == "Aadhar Card")
              Container(
                height: 500.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    //color: Colors.blue,
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aadhar No.",
                      style: AppTheme.smallHead,
                    ),
                    SizedBox(
                      height: 59.h,
                      // color: Colors.red,
                      child: TextFormField(
                        initialValue: "2345667543567",
                        cursorColor: AppTheme.textColor,
                        style: AppTheme.tabText,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 15.h),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            borderSide: BorderSide(
                                color: AppTheme.smallText, width: 0.5.w),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            borderSide: BorderSide(
                                color: AppTheme.textColor, width: 0.5.w),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    _image != null
                        ? ClipRect(
                            //  child: Image.file(_image!,fit: BoxFit.contain,width: double.infinity,height: 400,),
                            child: Row(
                              children: [
                                Icon(Icons.visibility_outlined,
                                    color: AppTheme.blueColor, size: 20.sp),
                                InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DocumentViewPage(
                                                image: _image,
                                              ))),
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          top: 10.h, bottom: 10.h),
                                      width: 300.w,
                                      //  color: Colors.red,
                                      child: Text(
                                        _image!.name.toString(),
                                        style: AppTheme.smallHeadBlue,
                                      )),
                                ),
                                Expanded(
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.delete_outlined,
                                          color: AppTheme.textColor,
                                        )))
                              ],
                            ),
                          )
                        : Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _pickImage();
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                height: 39.h,
                                width: 136.w,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30.r)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add_circle,
                                      color: AppTheme.backColor,
                                      size: 19.sp,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "Upload Doc",
                                      style: AppTheme.buttonText,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            if (_selectedDocument == "Pan Card")
              Container(
                height: 500.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    //color: Colors.blue,
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pan Card No.",
                      style: AppTheme.smallHead,
                    ),
                    SizedBox(
                      height: 59.h,
                      // color: Colors.red,
                      child: TextFormField(
                        initialValue: "ABCTY1234D",
                        cursorColor: AppTheme.textColor,
                        style: AppTheme.tabText,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 15.h),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            borderSide: BorderSide(
                                color: AppTheme.smallText, width: 0.5.w),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            borderSide: BorderSide(
                                color: AppTheme.textColor, width: 0.5.w),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    _image != null
                        ? ClipRect(
                            //  child: Image.file(_image!,fit: BoxFit.contain,width: double.infinity,height: 400,),
                            child: Row(
                              children: [
                                Icon(Icons.visibility_outlined,
                                    color: AppTheme.blueColor, size: 20.sp),
                                InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DocumentViewPage(
                                                image: _image,
                                              ))),
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          top: 10.h, bottom: 10.h),
                                      width: 300.w,
                                      //  color: Colors.red,
                                      child: Text(
                                        _image!.name.toString(),
                                        style: AppTheme.smallHeadBlue,
                                      )),
                                ),
                                Expanded(
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.delete_outlined,
                                          color: AppTheme.textColor,
                                        )))
                              ],
                            ),
                          )
                        : Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _pickImage();
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                height: 39.h,
                                width: 136.w,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30.r)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add_circle,
                                      color: AppTheme.backColor,
                                      size: 19.sp,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "Upload Doc",
                                      style: AppTheme.buttonText,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 50.h),
        child: _image != null
            ? const ButtonWidget(buttonTextContent: "Submit")
            : const LightButtonWidget(buttonTextContent: "Submit"),
      ),
    );
  }
}
