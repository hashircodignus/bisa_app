import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/resources/theme.dart';
import '../more_screen/create_card_screen/create_card_page/cubit/create_card_cubit.dart';
import '../profile_screen/profile_page.dart';

class CardTab extends StatefulWidget {
  const CardTab({
    super.key,
  });

  @override
  State<CardTab> createState() => _CardTabState();
}

class _CardTabState extends State<CardTab> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CreateCardCubit>(context).getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backColor,
      //padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: double.infinity,
      child: SingleChildScrollView(child:
      BlocBuilder<CreateCardCubit, CreateCardState>(
          builder: (context, state) {
            if (state is CreateCardLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppTheme.textColor,
                ),
              );
            }
            if (state is CreateCardLoaded) {
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.cardModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    // final name = doc['name'];
                    // final designation = doc['profession'];
                    // final cardImageDp = doc['imageUrl'];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                    cardModel: state.cardModel[index])));
                      },
                      child: ListTile(
                        leading: Container(
                          height: 49.h,
                          width: 49.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.r),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      state.cardModel[index].imageUrl),
                                  fit: BoxFit.cover)),
                          //  child: Image.network(cardImageDp,fit: BoxFit.cover,),
                        ),
                        trailing: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                        title: Text(state.cardModel[index].name),
                        subtitle: Text(state.cardModel[index].profession),
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
          })),
    );
  }
}