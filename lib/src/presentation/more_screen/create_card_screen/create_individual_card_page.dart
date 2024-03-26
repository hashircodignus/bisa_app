import 'package:bisa_app/src/presentation/more_screen/create_card_screen/create_individual_card_second_page.dart';
import 'package:bisa_app/src/presentation/widget/button_widget.dart';
import 'package:bisa_app/src/utils/resources/asset_resources.dart';
import 'package:bisa_app/src/utils/resources/theme.dart';
import 'package:flutter/material.dart';
import '../../widget/custom_data_textfield.dart';

class CreateIndividualCardPage extends StatelessWidget {
   CreateIndividualCardPage({super.key});
  final TextEditingController _companyNameController= TextEditingController();
  final TextEditingController _nameController= TextEditingController();
  final TextEditingController _designationController= TextEditingController();
  final TextEditingController _addressController= TextEditingController();
  final TextEditingController _businessController= TextEditingController();
  final TextEditingController _websiteController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: AppTheme.backColor,
        titleSpacing:-15,
        leadingWidth: 60,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.keyboard_arrow_left_rounded,size: 30,color: AppTheme.textColor,)),
        title: Text("Create Card",style: AppTheme.pageHead,),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
        height: double.infinity,
        width: double.infinity,
        color: AppTheme.backColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                  // color: Colors.red,
                ),
                child: Center(
                  child: Container(
                    height: 82,
                    width: 82,
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage(AssetResources.userDp)),
                      border: Border.all(color: AppTheme.smallText,width: 1),
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),

                  ),
                ),
              ),
               CustomDataTextField(prefixIcon: const Icon(Icons.apartment_outlined,color: AppTheme.textColor), hintText: 'Company Name', controller: _companyNameController,),
              // SizedBox(height: 10,),
               CustomDataTextField(prefixIcon:const Icon( Icons.person_outline_outlined,color: AppTheme.textColor), hintText: "Full Name", controller: _nameController,),
              // SizedBox(height: 10,),
               CustomDataTextField(prefixIcon: const Icon(Icons.account_balance_outlined,color: AppTheme.textColor), hintText: "Designation", controller: _designationController,),
              //SizedBox(height: 10,),
               CustomDataTextField(prefixIcon:const Icon( Icons.location_on_outlined,color: AppTheme.textColor), hintText: "Address", controller: _addressController,),
              // SizedBox(height: 10,),
               CustomDataTextField(prefixIcon: const Icon(Icons.web_outlined,color: AppTheme.textColor), hintText: "Business Details", controller: _businessController,),
              // SizedBox(height: 10,),
               CustomDataTextField(prefixIcon: const Icon(Icons.language_rounded,color: AppTheme.textColor), hintText: "Website", controller: _websiteController,),
              const SizedBox(height: 70,),
               ButtonWidget(buttonTextContent: "NEXT",onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateIndividualCardSecondPage())))
            ],
          ),
        ),

      ),
    );
  }
}

