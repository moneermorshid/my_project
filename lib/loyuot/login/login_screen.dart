// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_conditional_rendering/conditional.dart';
//
// import '../../shared/component/componants.dart';
// import '../../shared/network/local/cache_helper.dart';
// import 'cubite/cubit.dart';
// import 'cubite/states.dart';
//
//
// class ShopLoginScreen extends StatelessWidget {
//   var formKey=GlobalKey<FormState>();
//   var emailController =TextEditingController();
//   var passwordController =TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context)=>ShopLoginCubit(),
//       child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
//         listener: (context,state){
//           if (state is ShopLoginSuccessState)
//             {
//               if(state.loginModel.status)
//               {
//                 print(state.loginModel.message);
//                 print(state.loginModel.data?.token);
//                 CacheHelper.saveData(
//                     key: 'token',
//                     value: state.loginModel.data?.token).then((value){
//                   // Navigator.pushAndRemoveUntil(
//                   //   context,MaterialPageRoute(builder: (context)=>ShopLoyout()),
//                   //     (rote)=>false,
//                   // );
//                 });
//               }else
//               {
//                 print(state.loginModel.message);
//
//                 showToast(
//                   state: ToastState.ERORR,
//                   text:state.loginModel.message
//                 );
//
//               }
//             }
//         },
//         builder: (context,state){
//           return Scaffold(
//             appBar: AppBar(),
//             body: Center(
//               child: SingleChildScrollView(
//                 child: SafeArea(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Form(
//                       key: formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
//                           Text("Login new to browes our hot offers",style:
//                           TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.grey),),
//                           SizedBox(
//                             height: 30.0,
//                           ),
//                           TextFormField(
//                             validator:(value)
//                             {
//                               if(value!.isEmpty){
//                                 return 'please enter your email address';
//                               }
//                               return null;
//                             },
//                             keyboardType:TextInputType.visiblePassword ,
//                             controller:emailController ,
//                             decoration:InputDecoration(
//                               labelText: 'Email address',
//                               prefixIcon: Icon(
//                                 Icons.email_outlined,
//                               ),
//                               border: OutlineInputBorder(),
//                             ),
//
//                           ),
//                           SizedBox(
//                             height: 20.0,
//                           ),
//                           TextFormField(
//                             validator:(value)
//                             {
//                               if(value!.isEmpty){
//                                 return 'password is tool short';
//                               }
//                               return null;
//                             },
//                             obscureText:ShopLoginCubit.get(context).isPassword,
//                             keyboardType:TextInputType.visiblePassword ,
//                             onFieldSubmitted:(value){
//                               if(formKey.currentState!.validate()){
//                                 ShopLoginCubit.get(context).userLogin(
//                                     email: emailController.text, password:passwordController.text);
//                               }
//                             } ,
//                             controller:passwordController ,
//                             decoration:InputDecoration(
//                               labelText: 'Password',
//                               prefixIcon: Icon(
//                                 Icons.lock_outline,
//                               ),
//                               suffix: IconButton(
//                                   onPressed: (){
//                                     ShopLoginCubit.get(context).changPasswordVisibility();
//                                   }, icon:Icon( ShopLoginCubit.get(context).suffix)),
//                               border: OutlineInputBorder(),
//                             ),
//
//                           ),
//                           SizedBox(
//                             height: 30.0,
//                           ),
//                           Container(
//                             width: double.infinity,
//                             height: 50.0,
//                             child: Conditional.single(
//                               context: context,
//                                conditionBuilder: (context) => state is! ShopLoginLoadingState,
//                                widgetBuilder:(context)=>MaterialButton(
//                                  onPressed:  (){
//                                    if(formKey.currentState!.validate()){
//                                      ShopLoginCubit.get(context).userLogin(
//                                          email: emailController.text, password:passwordController.text);
//                                    }
//
//                                    //
//                                    // if(formkey.currentState!.validate())
//                                    // {
//                                    //   print(emilControlaer.text);
//                                    //   print(passwordControlaer.text);
//                                    //   elsif;
//                                    //   Navigator.push(context,MaterialPageRoute(builder: (context)=>TabsScreen()));
//                                    // }
//                                    //
//
//                                  },
//                                  child:Text(
//                                    'login'.toUpperCase(),
//                                    style: TextStyle(
//                                        fontSize: 20.0,
//                                        color: Colors.white,
//                                        fontWeight: FontWeight.bold
//                                    ),
//                                  ) ,
//                                  color: Colors.blue,
//                                ),
//                               fallbackBuilder:(context)=>Center(child: CircularProgressIndicator()),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10.0,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text('Don\'t have an counte ?'),
//                               defualtTextButton(
//                                   function: (){
//                                     // Navigator.push(
//                                     //   context,MaterialPageRoute(builder: (context)=>RegisterScreen()),
//                                     // );
//                                     // navigateTo(
//                                     //     rout: RegisterScreen(),
//                                     //     context: context);
//                                   },
//                                   text: 'register now ')
//                             ],
//                           ),
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//           );
//         },
//       ),
//     );
//   }
// }
