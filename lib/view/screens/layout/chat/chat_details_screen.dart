import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/cubit/layout/cubit.dart';
import 'package:my_social_app/cubit/layout/state.dart';
import 'package:my_social_app/models/user_model.dart';

import '../../../widget/chat/create_message.dart';
import '../../../widget/chat/create_my_message.dart';


class ChatDetailsScreen extends StatelessWidget {
   ChatDetailsScreen({Key? key, required this.userModel})
      : super(key: key);
  final UserModel userModel;
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var textController = TextEditingController();
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    userModel.image!,
                  ),
                ),
                const SizedBox(width: 15,),
                Text(userModel.name!, style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                CreateMessage(),
                CreateMyMessage(),
                Spacer(),
                defaultTextForm(context),
              ],
            ),
          ),
        );
      },
    );
  }
Widget defaultTextForm(context

){
    return Container(
      padding: const EdgeInsets.only(left: 10.0,right: 0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: textController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'write your message here....'
              ),
            ),
          ),
         Container(
           color: Colors.blue,
           //clipBehavior: Clip.antiAlias,
           child: IconButton(
               onPressed: (){
                 LayoutCubit.get(context).sendMessage(
                     receiveId: userModel.uid!,
                     textMessage: textController.text,
                     dateTime: DateTime.now().toString(),
                 );

               },
               icon: const Icon(Icons.send_outlined),color: Colors.white,),
         ),
        ],
      ),
    );

}
}
