import 'package:flutter/material.dart';
import 'package:my_social_app/models/user_model.dart';
import 'package:my_social_app/view/screens/layout/chat/chat_details_screen.dart';
import 'package:my_social_app/view/widget/navigatorPage/navigator_page.dart';

  Widget usersWidget(UserModel model , context) {
    return InkWell(
      onTap: (){
        navigatorTo(context, ChatDetailsScreen(userModel: model,));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
             CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
               model.image!,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(model.name!,
                style:
                Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }

