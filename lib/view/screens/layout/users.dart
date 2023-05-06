import 'package:flutter/material.dart';
import 'package:my_social_app/share_preference/shared_preference.dart';
import 'package:my_social_app/view/screens/login/loginScreen.dart';
import 'package:my_social_app/view/widget/navigatorPage/navigator_page.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: TextButton(

       onPressed: () {
         SharedPreferenceCach.logout(key: 'uId').then((value) => navigatorTo(context, const LoginScreen()));
       },
       child: const Text('Users') ,
      ),
    );
  }
}
