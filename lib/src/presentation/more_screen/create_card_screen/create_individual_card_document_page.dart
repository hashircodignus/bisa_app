import 'package:bisa_app/src/presentation/more_screen/create_card_screen/document_view_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/resources/theme.dart';

class CreateIndividualCardDocumentPage extends StatefulWidget {
  const CreateIndividualCardDocumentPage({super.key});

  @override
  State<CreateIndividualCardDocumentPage> createState() => _CreateIndividualCardDocumentPageState();
}

class _CreateIndividualCardDocumentPageState extends State<CreateIndividualCardDocumentPage> {
  String? _selectedDocument;
  XFile? _image;

  void _pickImage() async{
    final picker = ImagePicker();

    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context, builder: (BuildContext context){
      return Container(
        padding: const EdgeInsets.only(left: 30,right: 20),
        decoration: const BoxDecoration(
            color: AppTheme.backColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(26),topLeft: Radius.circular(26))
        ),
        height: 130,
        child: Row(
          children: [
            //Text("Select Image Source",style: AppTheme.buttonText,),
            InkWell(
              onTap: (){
                Navigator.pop(context);
                _getImage(ImageSource.camera);
              },
              child: Container(
                height: 78,
                width: 58,
                decoration: const BoxDecoration(

                    image: DecorationImage(image: AssetImage(AssetResources.camera),alignment: Alignment.topCenter)
                ),
                child: Align(
                    alignment: const Alignment(0, 1),
                    child: Text("Camera",style: AppTheme.optionsText,)),
              ),
            ),
            const SizedBox(width: 20,),
            InkWell(
              onTap: (){
                Navigator.pop(context);
                _getImage(ImageSource.gallery);
              },
              child: Container(
                height: 78,
                width: 58,
                decoration: const BoxDecoration(

                    image: DecorationImage(image: AssetImage(AssetResources.gallery),alignment: Alignment.topCenter)
                ),
                child: Align(
                    alignment: const Alignment(0, 1),
                    child: Text("Gallery",style: AppTheme.optionsText,)),
              ),
            ),
            const SizedBox(width: 20,),
            InkWell(
              onTap: (){
                Navigator.pop(context);
                //  _getImage(ImageSource);
              },
              child: Container(
                height: 78,
                width: 58,
                decoration: const BoxDecoration(

                    image: DecorationImage(image: AssetImage(AssetResources.document),alignment: Alignment.topCenter)
                ),
                child: Align(
                    alignment: const Alignment(0, 1),
                    child: Text("Document",style: AppTheme.optionsText,)),
              ),
            ),
          ],
        ),
      );
    });
  }

  void _getImage(ImageSource source) async{
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);
    if(pickedImage != null){
      setState(() {
        //  _image = XFile(pickedImage.name);
        _image = XFile(pickedImage.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  Container(
          height: 120,
          padding: const EdgeInsets.only(bottom: 60,left: 20,right: 20),
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppTheme.backColor
          ),
          child: ButtonWidget(buttonTextContent: 'Verify',onPressed: (){},)),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.backColor,
        titleSpacing:-15,
        leadingWidth: 60,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.keyboard_arrow_left_rounded,color:AppTheme.textColor,size: 30,)),
        title: Text("Create Card",style: AppTheme.pageHead,),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        height: double.infinity,
        width: double.infinity,
        color: AppTheme.backColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10,right: 10),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5,color: AppTheme.smallText),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    // Text("Choose Document",style: AppTheme.fieldText2,),
                    Expanded(
                      child: DropdownButton<String>(
                        dropdownColor: AppTheme.backColor,
                        style:AppTheme.fieldText,
                        elevation: 1,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined,color: AppTheme.smallText,size: 30,),
                        hint: const Row(
                          children: [
                            Icon(Icons.receipt_long_outlined),
                            SizedBox(width: 10,),
                            Text("Choose Document")
                          ],
                        ),
                        underline: Container(),
                        value: _selectedDocument,
                        items: const [
                          DropdownMenuItem<String>(
                            value: "Aadhar Card",
                            child: Row(
                              children: [
                                Icon(Icons.check_circle,color: Colors.green,),
                                SizedBox(width: 10,),
                                Text("Aadhar Card")
                              ],
                            ),),
                          // DropdownMenuItem<String>(
                          //   value: "GST Bills",
                          //   child:  Row(
                          //     children: [
                          //       Icon(Icons.check_circle,color: Colors.green,),
                          //       SizedBox(width: 10,),
                          //       Text("GST Bills")
                          //     ],
                          //   ),),
                          // DropdownMenuItem<String>(
                          //   value: "Property Document",
                          //   child:  Row(
                          //     children: [
                          //       Icon(Icons.check_circle,color: Colors.green,),
                          //       SizedBox(width: 10,),
                          //       Text("Property Document")
                          //     ],
                          //   ),),
                          // DropdownMenuItem<String>(
                          //   value: "Building Number",
                          //   child:  Row(
                          //     children: [
                          //       Icon(Icons.check_circle,color: Colors.green,),
                          //       SizedBox(width: 10,),
                          //       Text("Building Number")
                          //     ],
                          //   ),),

                        ], onChanged: (String? value){
                        setState(() {
                          _selectedDocument = value;
                        });
                      },
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              if(_selectedDocument=="Aadhar Card")
                Container(
                  height: 500,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    //color: Colors.blue,
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Aadhar No.",style: AppTheme.smallHead,),
                      TextFormField(
                        initialValue: "2345667543567",
                        cursorColor: AppTheme.textColor,
                        style: AppTheme.tabText,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            suffix: IconButton(onPressed: (){
                              setState(() {
                                _pickImage();
                              });
                            }, icon: const Icon(Icons.add_circle,color: Colors.green,),padding: const EdgeInsets.all(0),),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: AppTheme.smallText,width: 1)
                            ),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: AppTheme.smallText,width: 1)
                            )
                        ),
                      ),
                      const SizedBox(height: 30,),
                      _image != null ?
                      ClipRect(
                        //  child: Image.file(_image!,fit: BoxFit.contain,width: double.infinity,height: 400,),
                        child: Row(
                          children: [
                            const Icon(Icons.visibility_outlined,color: AppTheme.blueColor, size: 20),
                            InkWell(
                              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DocumentViewPage(image: _image,))),
                              child: Container(
                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                  width: 300,
                                  //  color: Colors.red,
                                  child: Text(_image!.name.toString(),style: AppTheme.smallHeadBlue,)),
                            ),
                            Expanded(child: IconButton(onPressed: (){
                              setState(() {

                              });
                            }, icon: const Icon(Icons.delete_outlined,color: AppTheme.textColor,)))
                          ],
                        ),
                      ) :
                      Container()
                    ],
                  ),
                ),
              // if(_selectedDocument=="GST Bills")
              //   Container(
              //     height: 500,
              //     width: double.infinity,
              //     decoration: const BoxDecoration(
              //       //color: Colors.green,
              //     ),
              //     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text("GST No.",style: AppTheme.smallHead,),
              //         TextFormField(
              //           initialValue: "12855938668",
              //           cursorColor: AppTheme.textColor,
              //           style: AppTheme.tabText,
              //           decoration: InputDecoration(
              //               contentPadding:const EdgeInsets.all(0),
              //               suffix:IconButton(onPressed: (){
              //                 _pickImage();
              //               }, icon:const Icon(Icons.add_circle,color: Colors.green,)),
              //               enabledBorder:const UnderlineInputBorder(
              //                   borderSide: BorderSide(color: AppTheme.smallText,width: 1)
              //               ),
              //               focusedBorder:const UnderlineInputBorder(
              //                   borderSide: BorderSide(color: AppTheme.smallText,width: 1)
              //               )
              //           ),
              //         ),
              //         const SizedBox(height: 30,),
              //         _image != null ?
              //         ClipRect(
              //           // child: Image.file(_image!,fit: BoxFit.contain,width: double.infinity,height: 400,),
              //           child: Row(
              //             children: [
              //               const Icon(Icons.visibility_outlined,color: AppTheme.blueColor, size: 20),
              //               InkWell(
              //                 onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DocumentViewPage(image: _image,))),
              //                 child: Container(
              //                     padding: const EdgeInsets.only(top: 10,bottom: 10),
              //                     width: 300,
              //                     // color: Colors.red,
              //                     child: Text(_image!.name.toString(),style: AppTheme.smallHeadBlue,)),
              //               ),
              //               Expanded(child: IconButton(onPressed: (){
              //               }, icon: const Icon(Icons.delete_outlined,color: AppTheme.textColor,)))
              //             ],
              //           ),
              //         ) :
              //         Container()
              //       ],
              //     ),
              //   ),
              // if(_selectedDocument=="Property Document")
              //   Container(
              //     height: 500,
              //     width: double.infinity,
              //     decoration: const BoxDecoration(
              //       //color: Colors.yellow,
              //     ),
              //     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text("Document No.",style: AppTheme.smallHead,),
              //         TextFormField(
              //           initialValue: "12855938668",
              //           cursorColor: AppTheme.textColor,
              //           style: AppTheme.tabText,
              //           decoration: InputDecoration(
              //               contentPadding:const EdgeInsets.all(0),
              //               suffix: IconButton(onPressed: (){
              //                 _pickImage();
              //               }, icon:const Icon(Icons.add_circle,color: Colors.green,)),
              //               enabledBorder:const UnderlineInputBorder(
              //                   borderSide: BorderSide(color: AppTheme.smallText,width: 1)
              //               ),
              //               focusedBorder:const UnderlineInputBorder(
              //                   borderSide: BorderSide(color: AppTheme.smallText,width: 1)
              //               )
              //           ),
              //         ),
              //         const SizedBox(height: 30,),
              //         _image != null ?
              //         ClipRect(
              //           //child: Image.file(_image!,fit: BoxFit.contain,width: double.infinity,height: 400,),
              //           child: Row(
              //             children: [
              //               const Icon(Icons.visibility_outlined,color: AppTheme.blueColor, size: 20),
              //               InkWell(
              //                 onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DocumentViewPage(image: _image,))),
              //                 child: Container(
              //                     padding: const EdgeInsets.only(top: 10,bottom: 10),
              //                     width: 300,
              //                     //color: Colors.red,
              //                     child: Text(_image!.name.toString(),style: AppTheme.smallHeadBlue,)),
              //               ),
              //               Expanded(child: IconButton(onPressed: (){
              //               }, icon: const Icon(Icons.delete_outlined,color: AppTheme.textColor,)))
              //             ],
              //           ),
              //         ) :
              //         Container()
              //       ],
              //     ),
              //   ),
              // if(_selectedDocument=="Building Number")
              //   Container(
              //     height: 500,
              //     width: double.infinity,
              //     decoration: const BoxDecoration(
              //       //color: Colors.teal,
              //     ),
              //     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text("Building No.",style: AppTheme.smallHead,),
              //         TextFormField(
              //           initialValue: "12855938668",
              //           cursorColor: AppTheme.textColor,
              //           style: AppTheme.tabText,
              //           decoration: InputDecoration(
              //               contentPadding:const EdgeInsets.all(0),
              //               suffix: IconButton(onPressed: (){
              //                 _pickImage();
              //               }, icon:const Icon(Icons.add_circle,color: Colors.green,)),
              //               enabledBorder:const UnderlineInputBorder(
              //                   borderSide: BorderSide(color: AppTheme.smallText,width: 1)
              //               ),
              //               focusedBorder:const UnderlineInputBorder(
              //                   borderSide: BorderSide(color: AppTheme.smallText,width: 1)
              //               )
              //           ),
              //         ),
              //         const SizedBox(height: 30,),
              //         _image != null ?
              //         ClipRect(
              //           //child: Image.file(_image!,fit: BoxFit.contain,width: double.infinity,height: 300,),
              //           child: Row(
              //             children: [
              //               const Icon(Icons.visibility_outlined,color: AppTheme.blueColor, size: 20),
              //               InkWell(
              //                 onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DocumentViewPage(image: _image,))),
              //                 child: Container(
              //                     width: 300,
              //                     padding: const EdgeInsets.only(top: 10,bottom: 10),
              //                     // color: Colors.red,
              //                     child: Text(_image!.name.toString(),style: AppTheme.smallHeadBlue,)),
              //               ),
              //               Expanded(child: IconButton(onPressed: (){
              //               }, icon: const Icon(Icons.delete_outlined,color: AppTheme.textColor,)))
              //             ],
              //           ),
              //         ) :
              //         Container(),
              //       ],
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
