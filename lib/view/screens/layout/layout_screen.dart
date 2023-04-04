import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/cubit/layout/cubit.dart';
import 'package:my_social_app/cubit/layout/state.dart';
import 'package:my_social_app/view/screens/login/loginScreen.dart';
import 'package:my_social_app/view/wedget/navigatorPage/navigator_page.dart';

import '../../../share_preference/shared_preference.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.title[cubit.currendIndex]),
          ),
          body: cubit.screens[cubit.currendIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currendIndex ,
            items: cubit.bottomNavigaton ,
            onTap: (index){
              cubit.changeBottom(index);
            },
          ),
        );
      },
    );
  }
}
