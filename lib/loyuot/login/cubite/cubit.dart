//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mysqlflutter/loyuot/login/cubite/states.dart';
// import 'package:mysqlflutter/models/login_model.dart';
//
// import '../../../shared/network/remote/dio_helper.dart';
//
// class ShopLoginCubit extends Cubit<ShopLoginStates>{
//
//   ShopLoginCubit():super(ShopLoginInitialState());
//   static ShopLoginCubit get(context)=>BlocProvider.of(context);
//   late ShopLoginModel loginModel;
//    void userLogin({
//     required String email,
//     required String password,
// }){
//      emit(ShopLoginLoadingState());
//      print("email : $email password : $password");
//      DioHelper.postData(
//          url:LOGIN,
//          data:{
//          'email':email,
//          'password':password
//          }).then((value){
//            print(value.data);
//            loginModel = ShopLoginModel.fromJson(value.data);
//            emit(ShopLoginSuccessState(loginModel));
//      }).catchError((error){
//        emit(ShopLoginErrorState(error.toString()));
//      });
//    }
//    IconData suffix = Icons.visibility_outlined;
//    bool isPassword= true;
//    void changPasswordVisibility(){
//      isPassword = !isPassword;
//
//      suffix=isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
//      emit(ShopChangePasswordVisibilityState());
//    }
// }