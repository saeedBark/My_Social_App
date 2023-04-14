import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_social_app/cubit/layout/cubit.dart';
import 'package:my_social_app/view/widget/chat/users_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => UsersWidget(
        image: cubit.users[index].image!,
        name: cubit.users[index].name!,
      ),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10,
      ),
      itemCount: cubit.users.length,
    );
  }
}
