import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/cubit/layout/cubit.dart';
import 'package:my_social_app/cubit/layout/state.dart';
import 'package:my_social_app/models/user_model.dart';

import '../../../widget/chat/create_message.dart';
import '../../../widget/chat/create_my_message.dart';

class ChatDetailsScreen extends StatelessWidget {
  ChatDetailsScreen({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(
    builder: (context) {
      LayoutCubit.get(context).getMessage(receiveId: userModel.uid!);
      return BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);
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
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    userModel.name!,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        if(cubit.userModel!.uid == cubit.messageList[index].sendId ) {
                          return  CreateMyMessage(message: cubit.messageList[index].textMessage!,);
                        }
                        return  CreateMessage(message: cubit.messageList[index].textMessage!,);
                      },
                      separatorBuilder: (context,index) => const SizedBox(height: 15,),
                      itemCount: cubit.messageList.length,
                    ),
                  ),
                  defaultTextForm(context),
                ],
              ),
            ),
          );
        },
      );
    },
    );
  }

  Widget defaultTextForm(context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 0),
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
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'write your message here....'),
            ),
          ),
          Container(
            color: Colors.blue,
            //clipBehavior: Clip.antiAlias,
            child: IconButton(
              onPressed: () {
                LayoutCubit.get(context).sendMessage(
                  receiveId: userModel.uid!,
                  textMessage: textController.text,
                  dateTime: DateTime.now().toString(),
                );
                textController.clear();
              },
              icon: const Icon(Icons.send_outlined),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
