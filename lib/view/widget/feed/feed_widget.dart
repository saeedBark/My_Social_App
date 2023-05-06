import 'package:flutter/material.dart';
import 'package:my_social_app/models/post_model.dart';

import '../../../cubit/layout/cubit.dart';
import '../../../utils/style.dart';

Widget feedWidget(PostModel model, context, index) {
  final cubit = LayoutCubit.get(context);
  return SizedBox(
    width: double.infinity,
    child: Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  model.image!,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(model.name!,
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        )
                      ],
                    ),
                    Text(model.datePost!,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(height: 1.5)),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          //  if(LayoutCubit.get(context).posts[index].imagePost != '')
          Text(
            model.textPost!,
            maxLines: 2,
            style: Styles.textStyle16.copyWith(
              fontSize: 18,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 10),
                child: SizedBox(
                  height: 20,
                  //   margin: EdgeInsets.symmetric(horizontal: 5),
                  child: MaterialButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    minWidth: 10,
                    child: Text(
                      '#Softwear',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                    image: NetworkImage(
                      model.imagePost!,
                    ),
                    fit: BoxFit.cover)),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(
                        Icons.favorite_outline,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(cubit.likes[index].toString()),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Icon(
                        Icons.chat,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('5 comment')
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey[300],
            ),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  cubit.userModel!.image!,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                'write a comment....',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.grey),
              )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
                    cubit.likePost(cubit.postId[index]);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.favorite_outline,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('0 like')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
