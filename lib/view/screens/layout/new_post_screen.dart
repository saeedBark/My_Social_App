import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/cubit/layout/cubit.dart';
import 'package:my_social_app/cubit/layout/state.dart';

import '../../../utils/style.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({Key? key}) : super(key: key);
  final textController = TextEditingController();
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
            title: Text(
              'Create New Post',
              style: Styles.textStyle16,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  var now = DateTime.now();
                  if (cubit.imagePostPicke != null) {
                    cubit.uploadImagePost(
                      textPost: textController.text,
                      datePost: now.toString(),
                    );
                  } else {
                    cubit.uploadCreatePost(
                        textPost: textController.text,
                        datePost: now.toString());
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Post',
                    style: Styles.textStyle16,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                if (state is LayoutUpdateDataPostLoadingState)
                  const LinearProgressIndicator(),
                //  if(state is LayoutUpdateDataPostLoadingState)
                // const SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        LayoutCubit.get(context).userModel!.image!,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        LayoutCubit.get(context).userModel!.name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: const InputDecoration(
                        hintText: 'Write your post...',
                        border: InputBorder.none),
                  ),
                ),
                if (cubit.imagePostPicke != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            image: DecorationImage(
                                image: FileImage(cubit.imagePostPicke!),
                                fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, top: 8),
                        child: Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: IconButton(
                              onPressed: () {
                                cubit.removeImagePicke();
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 25,
                                color: Colors.white,
                              ),
                            )),
                      )
                    ],
                  ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.image_outlined,
                              color: Colors.blue,
                            ),
                            Text(
                              'Add Photo',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        onTap: () {
                          cubit.getImagePost();
                        },
                      ),
                    ),
                    const Spacer(),
                    const Expanded(
                      child: Text(
                        '# tags',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
