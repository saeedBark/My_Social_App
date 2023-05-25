import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/components/colors.dart';
import 'package:my_social_app/cubit/login/cubit.dart';
import 'package:my_social_app/cubit/login/state.dart';
import 'package:my_social_app/view/screens/layout/layout_screen.dart';
import 'package:my_social_app/view/screens/register/register_screen.dart';
import '../../../share_preference/shared_preference.dart';
import '../../widget/default_bottom.dart';
import '../../widget/default_text.dart';
import '../../widget/default_text_form_file.dart';
import '../../widget/navigatorPage/navigator_page.dart';
import '../../widget/package/show_toast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              navigatorAndReplace(context, const LayoutScreen());
            }).catchError((error) {
              print(error.toString());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: const LoginForm(),
          );
        },
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.get(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: cubit.formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DefaultText(
                text: 'LOGIN',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: defaultColor),
            const SizedBox(
              height: 10,
            ),
            const DefaultText(
                text: 'Entre your email and password ',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
            const SizedBox(
              height: 30,
            ),
            DefaultFromFile(
              controller: cubit.emailController,
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
            TextFormField(
              controller: cubit.passwordController,
              obscureText: cubit.isPassword,
              onTap: () {
                cubit.changPasswordShow();
              },
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please you must fill password here..';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.password),
                suffixIcon: cubit.suffix != null ? Icon(cubit.suffix) : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ConditionalBuilder(
              condition: !cubit.isLoading,
              builder: (context) => DefaultBottom(
                color: defaultColor,
                function: () {
                  if (cubit.formkey.currentState!.validate()) {
                    cubit.userLogin(
                        email: cubit.emailController.text,
                        password: cubit.passwordController.text);
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
                const DefaultText(
                  text: "Don't have already email?",
                ),
                TextButton(
                    onPressed: () {
                      navigatorAndReplace(context, const RegisterScreen());
                    },
                    child: const DefaultText(
                        text: 'Register', color: Colors.blue)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
