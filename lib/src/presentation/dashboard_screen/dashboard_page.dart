import 'package:bisa_app/src/presentation/dashboard_screen/widget/grid_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/asset_resources.dart';
import '../../utils/resources/theme.dart';
import '../more_screen/create_card_screen/create_business_card_page.dart';
import '../more_screen/create_card_screen/create_individual_card_page.dart';
import '../widget/pop_up_alert_dialog_box_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       elevation: 0,
        backgroundColor: AppTheme.backColor,
        toolbarHeight: 129.h,
        title:  Image(image: const AssetImage(AssetResources.appLogo),height: 39.h,width: 105.w,),
       centerTitle: true,
       bottom:  PreferredSize(preferredSize: Size.square(0.h), child: Padding(
         padding: EdgeInsets.only(left: 20.w,right: 20.w),
         child:  Divider(height: 0.h,thickness: 0.5.w,color: AppTheme.smallText,),
       )),
      ),
      body: Container(
        padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h),
        color: AppTheme.backColor,
        child: GridView(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          mainAxisSpacing: 20.h,crossAxisSpacing: 20.w,
          mainAxisExtent: 98.h,
        ),
        children: [
          GridViewCard(subtitle: Text("10",style: AppTheme.headTextWhite,), title: 'My Card',),
          GridViewCard(subtitle: Text("10",style: AppTheme.headTextWhite,), title: 'Shared',),
          GridViewCard(subtitle: Text("10",style: AppTheme.headTextWhite,), title: 'Saved Candidates',),
           GridViewCard(subtitle: Icon(Icons.add_circle,color: Colors.green,size: 26.h,), title: 'Create account',onTap: ()=>showDialog(context: context, builder: (BuildContext context){
             return PopUpAlertDialogBox(
               widget: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   InkWell(
                     onTap:()
                     { Navigator.pop(context);
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateBusinessCardPage()));

                     },
                     child: Card(
                       elevation:2,
                       child: Container(
                         padding: const EdgeInsets.only(left: 10,right: 10),
                         height: 60,
                         width: 300,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8),
                           color: Colors.white,
                           //border: Border.all(color: AppTheme.smallText,width: 0.2),
                           // boxShadow: [BoxShadow(
                           //   color: AppTheme.textColor,blurRadius: 1
                           // )]
                         ),
                         child: Row(
                           children: [
                             const Icon(Icons.card_travel_outlined,color: AppTheme.textColor,),
                             const SizedBox(width: 20,),
                             Text("Create Business",style: AppTheme.tabText,)
                           ],
                         ),
                       ),
                     ),
                   ),
                   InkWell(
                     onTap: (){
                       Navigator.pop(context);
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateIndividualCardPage()));},
                     child: Card(
                       elevation:2,
                       child: Container(
                         padding: const EdgeInsets.only(left: 10,right: 10),
                         height: 60,
                         width: 300,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8),
                           color: Colors.white,
                           //border: Border.all(color: AppTheme.smallText,width: 0.2),
                           // boxShadow: [BoxShadow(
                           //   color: AppTheme.textColor,blurRadius: 1
                           // )]
                         ),
                         child: Row(
                           children: [
                             const Icon(Icons.person,color: AppTheme.textColor,),
                             const SizedBox(width: 20,),
                             Text("Create Individual",style: AppTheme.tabText,)
                           ],
                         ),
                       ),
                     ),
                   ),
                 ],
               ), height: 250, color: AppTheme.backColor,
             );
           }),),


        ],
        ),
      ),
    );
  }
}


