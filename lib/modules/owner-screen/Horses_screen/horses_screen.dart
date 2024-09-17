import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_cubit.dart';
import 'package:graduation_project/layouts/owner_home_layout/cubit/owner_state.dart';
import 'package:graduation_project/shared/component/components.dart';

import '../../../models/horse_model.dart';
import 'HorseDetails.dart';
import 'add_horses_screen.dart';

class HorsesScreen extends StatelessWidget {
  const HorsesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return BlocConsumer<OwnerCubit,OwnerState>(
        builder: (context,state){
          late HorseModel model;
          var cubit=OwnerCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.green,
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                navigateTo(context, AddHorseScreen());
              },
              child: Icon(
                  Icons.add
              ),
            ),
            body: ConditionalBuilder(
              condition: cubit.horses.length>0,
              builder:(context)=>SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   width: double.infinity,
                    //   height: 170.0,
                    //   child: Card(
                    //     clipBehavior: Clip.antiAliasWithSaveLayer,
                    //     elevation: 20.0,
                    //     child: Image(
                    //       image: NetworkImage(
                    //           'https://image.freepik.com/free-vector/food-menu-banner-social-media-post_166746-86.jpg?w=1060'),
                    //       fit: BoxFit.cover,
                    //       height: 150.0,
                    //     ),
                    //   ),
                    // ),
                    ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,index)=>buildHorseCard(
                            cubit.horses[index],
                            size,
                          (){
                              navigateTo(context, HorseDetailsScreen());
                              cubit.getHorseDetails(
                                  horseId: cubit.horsesId[cubit.index],
                              );
                        }
                        ),
                        separatorBuilder:(context,index)=> myDivider(),
                        itemCount: cubit.horses.length)

                  ],
                ),
              ) ,
              fallback:(context)=>Center(child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage('https://www.europeanequinelawyers.com/wp-content/uploads/2018/03/brexit-1024x682.jpg'),
                  ),
                  Text(
                      'No horses Yet !!!!',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  )
                ],
              ))  ,
            ),
          );
        },
        listener: (context,state){


        });
  }
  Widget buildHorseCard(HorseModel model,var size,var onPressed)=> InkWell(
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      height: 190.0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 160.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 25),
                      blurRadius: 25,
                      color: Colors.black26),
                ]),
          ),
          Positioned(
              top: 0.0,
              left: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                height: 140,
                width: 200,
                child: Container(
                  height:80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(70),
                    image: DecorationImage(
                      image: NetworkImage('${model.horseImage}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          Positioned(
              bottom: 0.0,
              right: 0.0,
              child: SizedBox(
                height: 130.0,
                width: size.width - 200,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            'الاسم :',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${model.horseName}',
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'الاب :',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${model.fatherName}',
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'الام :',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${model.motherName}',
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'العنبر :',
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${model.sectionNum}',
                            style: TextStyle(
                                color: Colors.brown,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),

    ),
    onTap: onPressed,
  );
}
