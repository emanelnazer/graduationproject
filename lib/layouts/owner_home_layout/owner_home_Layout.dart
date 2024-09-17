import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/component/components.dart';

import '../home_layout/cubit/cubit.dart';
import '../home_layout/cubit/states.dart';
import 'cubit/owner_cubit.dart';
import 'cubit/owner_state.dart';



class OwnerHomeScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>OwnerCubit(),
      child: BlocConsumer<OwnerCubit,OwnerState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=OwnerCubit.get(context);
          return Scaffold(
            body: cubit.ownerScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              currentIndex: cubit.currentIndex,
              onTap: (index){

                cubit.changeBottomNavIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
