import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/view/screens/loginScreen.dart';
import 'package:my_social_app/view/wedget/navigatorPage/navigator_page.dart';

import '../../share_preference/shared_preference.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: TextButton(child:Text ('saeed'),onPressed: (){
            SharedPreferenceCach.logout(key: 'uId').then((value) {
              navigatorAndReplace(context,LoginScreen());
            });
          },),
        ),
      ),
    );
  }
}
