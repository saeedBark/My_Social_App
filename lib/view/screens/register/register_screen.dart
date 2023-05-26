import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/cubit/register/cubit.dart';
import 'package:my_social_app/cubit/register/state.dart';
import 'package:my_social_app/view/screens/layout/layout_screen.dart';

import '../../../components/colors.dart';
import '../../widget/default_bottom.dart';
import '../../widget/default_text.dart';
import '../../widget/default_text_form_file.dart';
import '../../widget/navigatorPage/navigator_page.dart';
import '../../widget/package/show_toast.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            showToast(color: Colors.red, text: state.error);
          } else {
            navigatorAndReplace(context, const LayoutScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: const RegisterForm(),
          );
        },
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.get(context);
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: cubit.formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const DefaultText(
                  text: 'REGISTER',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: defaultColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                DefaultFromFile(
                  controller: cubit.namedController,
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
                  controller: cubit.emailController,
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
                  onTap: () {
                    cubit.changPasswordShow();
                  },
                  controller: cubit.passwordController,
                  isPassword: cubit.isPassword,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please you must fill your password here..';
                    }
                    return null;
                  },
                  suffix: cubit.suffix,
                  lable: 'Password',
                  prefix: Icons.password,
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultFromFile(
                  controller: cubit.phoneController,
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
                    color: defaultColor,
                    function: () {
                      if (cubit.formkey.currentState!.validate()) {
                        cubit.userRegister(
                            email: cubit.emailController.text,
                            password: cubit.passwordController.text,
                            name: cubit.namedController.text,
                            phone: cubit.phoneController.text);
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
    );
  }
}
