import 'package:bisa_app/src/presentation/widget/custom_data_textfield.dart';
import 'package:bisa_app/src/presentation/widget/search_text_field.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:flutter/material.dart';
import '../../../utils/resources/theme.dart';
import '../widget/card_details_container_widget.dart';
import 'create_individual_card_document_page.dart';

class CreateIndividualCardSecondPage extends StatelessWidget {
  const CreateIndividualCardSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
        bottomNavigationBar:Container(
          height: 100,
          color: AppTheme.backColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                InkWell(
                  onTap:(){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppTheme.backColor,
                        border: Border.all(width: 0.3,color: AppTheme.textColor)
                    ),
                    width: 155,
                    child: Center(child: Text("Back",style: AppTheme.fieldText,)),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateIndividualCardDocumentPage()));
                  },
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppTheme.textColor
                    ),
                    width: 155,
                    child: Center(child: Text("Next",style: AppTheme.buttonText,)),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 5),
          height: double.infinity,
          width: double.infinity,
          color: AppTheme.backColor,
          child:  SingleChildScrollView(
            child: Column(
              children: [
                const CardDetailsContainer(
                    height: 200,
                    cardHead: 'PHONE NUMBER',
                    widget: Column(
                      children: [
                        CustomDataTextField(prefixIcon: Icon(Icons.phone_outlined,color: AppTheme.textColor,),initialValue: "1234567890",hintText: "Phone Number"),
                        CustomDataTextField(prefixIcon: Icon(Icons.phone_outlined,color: AppTheme.textColor,),hintText: "Phone Number"),
                      ],
                    )
                ),
                const SizedBox(height: 10,),
                const CardDetailsContainer(cardHead: "EMAIL ADDRESS",
                    height: 130,
                    widget: Column(
                      children: [
                        CustomDataTextField(prefixIcon: Icon(Icons.mail_outline_rounded,color: AppTheme.smallText,),hintText: "Email Address")
                      ],
                    )),
                const SizedBox(height: 10,),
                CardDetailsContainer(
                    height: 210,
                    cardHead: "SOCIAL MEDIA", widget: Column(
                  children: [
                    CustomDataTextField(
                      initialValue: "Facebook.com/23345567876",
                      onTap: ()=>showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context, builder: (BuildContext context){
                        return Container(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          height: 350,
                          decoration: const BoxDecoration(
                              color: AppTheme.backColor,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(26),topRight: Radius.circular(26))
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 15,),
                                padding: const EdgeInsets.only(left: 25,right: 5),

                                decoration: BoxDecoration(
                                  color: AppTheme.textColor,
                                  borderRadius: BorderRadius.circular(30),),
                                child:   SearchTextField(cursorColor: AppTheme.backColor,
                                  hintText: "Search Icons",
                                  style: AppTheme.smallHeadWhite,
                                  hintStyle: AppTheme.smallHeadWhite,
                                  icon:  const Icon(Icons.search,color: AppTheme.backColor,),
                                ),
                              ),
                              const SizedBox(height: 30,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.whatsApp),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.behance),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.whatsApp),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.behance),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.whatsApp),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.behance),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.whatsApp),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.behance),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                      prefixIconConstraints: const BoxConstraints(maxWidth: 50,maxHeight: 50),
                      prefixIcon: Center(
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              image: const DecorationImage(image: AssetImage(AssetResources.faceBook)),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: AppTheme.textColor,width: 0.2)
                          ),
                        ),
                      ),
                    ),
                    CustomDataTextField(
                      // initialValue: "Facebook.com/23345567876",
                      onTap: ()=>showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context, builder: (BuildContext context){
                        return Container(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          height: 350,
                          decoration: const BoxDecoration(
                              color: AppTheme.backColor,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(26),topRight: Radius.circular(26))
                          ),
                          child: Column(
                            children: [
                              Container(

                                margin: const EdgeInsets.only(top: 15,),
                                padding: const EdgeInsets.only(left: 25,right: 5),

                                decoration: BoxDecoration(
                                  color: AppTheme.textColor,
                                  borderRadius: BorderRadius.circular(30),),
                                child:   SearchTextField(cursorColor: AppTheme.backColor,
                                  hintText: "Search Icons",
                                  style: AppTheme.smallHeadWhite,
                                  hintStyle: AppTheme.smallHeadWhite,
                                  icon:  const Icon(Icons.search,color: AppTheme.backColor,),
                                ),
                              ),
                              const SizedBox(height: 30,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.whatsApp),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.behance),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.whatsApp),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.behance),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.whatsApp),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.behance),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.whatsApp),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.behance),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.faceBook),fit: BoxFit.cover)
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: const DecorationImage(image: AssetImage(AssetResources.instagram),fit: BoxFit.cover)
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                      prefixIconConstraints: const BoxConstraints(maxWidth: 50,maxHeight: 50),
                      prefixIcon: Center(
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            //image: DecorationImage(image: AssetImage(AssetResources.faceBook)),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: AppTheme.textColor,width: 0.2)
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


