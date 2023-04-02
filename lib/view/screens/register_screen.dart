import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/cubit/register/cubit.dart';
import 'package:my_social_app/cubit/register/state.dart';
import 'package:my_social_app/pages/wedget/default_text.dart';
import 'package:my_social_app/view/screens/layout_screen.dart';
import 'package:my_social_app/view/wedget/default_bottom.dart';
import 'package:my_social_app/view/wedget/default_text_form_file.dart';
import 'package:my_social_app/view/wedget/navigatorPage/navigator_page.dart';
import 'package:my_social_app/view/wedget/package/show_toast.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var namedController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
           if (state is RegisterErrorState) {
                   showToast(color: Colors.red, text: state.error);
           }else {
             navigatorAndReplace(context, LayoutScreen());
           }
          //   if (state.mod.status!) {
          //     SharedPreferenceCach.saveData(
          //             key: 'token', value: state.mod.data!.token)
          //         .then((value) {
          //       token = state.mod.data!.token;
          //
          //       toastShow(text: state.mod.message!, color: Colors.amber);
          //       navigatorAndReplace(context, const LayoutScreen());
          //     }).catchError((error) {
          //       print(error.toString());
          //     });
          //   } else {
          //     // print(state.mod.message!);
          //     toastShow(text: state.mod.message!, color: Colors.red);
          //   }

          //
          },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultText(
                            text: 'REGISTER',
                            fontSize: 24,
                            fontWiedght: FontWeight.bold,
                            color: const Color(0xFFD319C2)),
                        const SizedBox(
                          height: 30,
                        ),
                        DefaultFromFile(
                          controller: namedController,
                          type: TextInputType.name,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please you must fill your name here..';
                            }
                            return null;
                          },
                          lable: 'Name',
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFromFile(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please you must fill your email here..';
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
                              return 'Please you must fill your password here..';
                            }
                            return null;
                          },
                          suffix: cubit.suffix,
                          onsumit: (v) {
                            cubit.changPasswordShow();
                          },
                          lable: 'Password',
                          prefix: Icons.password,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultFromFile(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please you must fill your phone here..';
                            }
                            return null;
                          },
                          lable: 'Phone',
                          prefix: Icons.phone,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: true,
                          // state is! LoginLoadingState,
                          builder: (context) => DefaultBottom(
                            function: () {
                              if (formkey.currentState!.validate()) {
                                cubit.userRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: namedController.text,
                                    phone: phoneController.text);
                              //  print('saeed');
                                //navigatorAndReplace(context, LayoutScreen());
                              }

                            },
                            text: 'Register',
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),

                      ],
                    ),
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
