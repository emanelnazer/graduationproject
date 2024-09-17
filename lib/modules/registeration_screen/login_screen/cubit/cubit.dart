import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/registeration_screen/login_screen/cubit/states.dart';




class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());


  static LoginCubit get(context)=>BlocProvider.of(context);

  void userLogin ({
    required String email,
    required String password,
  }){
    emit(LoginLoadingState());


    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value){
          emit(LoginSuccessState(value.user!.uid));
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });
    



  }

  IconData suffixIcon=Icons.visibility;
  bool isPassword=true;

  void changePasswordVisibility(){

    isPassword=!isPassword;
    suffixIcon=isPassword?Icons.visibility:Icons.visibility_off;

    emit(LoginChangePasswordVisibilityState());
  }


}







