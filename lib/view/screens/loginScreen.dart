import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/components/colors.dart';
import 'package:my_social_app/cubit/login/cubit.dart';
import 'package:my_social_app/cubit/login/state.dart';
import 'package:my_social_app/pages/wedget/default_text.dart';
import 'package:my_social_app/view/screens/layout_screen.dart';
import 'package:my_social_app/view/screens/register_screen.dart';
import 'package:my_social_app/view/wedget/default_bottom.dart';
import 'package:my_social_app/view/wedget/default_text_form_file.dart';
import 'package:my_social_app/view/wedget/navigatorPage/navigator_page.dart';
import 'package:my_social_app/view/wedget/package/show_toast.dart';

import '../../share_preference/shared_preference.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(color: Colors.red, text: state.error);
          } else if (state is LoginSuccessState) {
            SharedPreferenceCach.saveData(key: 'uId', value: state.model)
                .then((value) {
              showToast(color: Colors.green, text: 'Success');
              navigatorAndReplace(context, LayoutScreen());
            }).catchError((errer) {
              print(errer.toString());
            });
          }

          // if (state is LoginSuccessState) {
          //   if (state.mod.status!) {
          //     SharedPreferenceCach.saveData(
          //             key: 'token', value: state.mod.data!.token)
          //         .then((value) {
          //       token = state.mod.data!.token;

          //       toastShow(text: state.mod.message!, color: Colors.green);
          //       navigatorAndReplace(context, const LayoutScreen());
          //     }).catchError((error) {
          //       print(error.toString());
          //     });
          //   } else {
          //     // print(state.mod.message!);
          //     toastShow(text: state.mod.message!, color: Colors.red);
          //   }

          // }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return SafeArea(
            child: Scaffold(
              // appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultText(
                          text: 'LOGIN',
                          fontSize: 24,
                          fontWiedght: FontWeight.bold,
                          color: const Color(0xFFD319C2)),
                      const SizedBox(
                        height: 10,
                      ),
                      DefaultText(
                          text: 'Please entre your email and password ',
                          fontSize: 20,
                          fontWiedght: FontWeight.bold,
                          color: Colors.grey),
                      const SizedBox(
                        height: 30,
                      ),
                      DefaultFromFile(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please you must fill email here..';
                          }
                          return null;
                        },
                        lable: 'Email',
                        prefix: Icons.email,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DefaultFromFile(
                        controller: passwordController,
                        isPassword: cubit.isPassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please you must fill password here..';
                          }
                          return null;
                        },
                        suffix: cubit.suffix,
                        onsumit: () {
                          cubit.changPasswordShow();
                        },
                        lable: 'Password',
                        prefix: Icons.password,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => DefaultBottom(
                          function: () {
                            if (formkey.currentState!.validate()) {
                              cubit.userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                              //  print('saeed');
                              //  navigatorAndReplace(context, HomeScreen());
                            }
                          },
                          text: 'LOgin',
                          isUpperCase: true,
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultText(
                            text: "Don't have alerdy email?",
                          ),
                          TextButton(
                              onPressed: () {
                                navigatorAndReplace(context, RegisterScreen());
                              },
                              child: DefaultText(
                                  text: 'Register', color: defaultColor)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
