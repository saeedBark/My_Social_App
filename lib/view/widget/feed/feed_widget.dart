import 'package:flutter/material.dart';
import 'package:my_social_app/cubit/layout/cubit.dart';

class FeedWidget extends StatelessWidget {
    FeedWidget(  {super.key, required this.image, required this.name, required this.datePost, required this.textPost, required this.imagePost, required this.userImage, this.postId,} );

 final String image;
 final String name;
 final String datePost;
 final String textPost;
 final String imagePost;
 final String userImage;
 final String? postId;

  @override
  Widget build(BuildContext context  ) {
    var cubit = LayoutCubit.get(context);
    return Container(
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
                        image,
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
                              Text(name,
                                  style:
                                  Theme.of(context).textTheme.titleLarge),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                              )
                            ],
                          ),
                          Text( datePost,
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
                  textPost,
                  style: Theme.of(context).textTheme.titleLarge,
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
                      image:  DecorationImage(
                          image: NetworkImage(
                            imagePost,
                          ),
                          fit: BoxFit.cover)),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: InkWell(
                        onTap: (){},
                        child: Row(
                          children: const [
                            Icon(Icons.favorite_outline,color: Colors.red,),
                            SizedBox(width: 5,),
                            Text('0')
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){},
                        child: Row(
                          children: const [
                            Icon(Icons.chat,color: Colors.amber,),
                            SizedBox(width: 5,),
                            Text('0 comment')
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
                        userImage,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(child: Text('write a comment....',style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),)),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          cubit.likePost(postId);
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.favorite_outline,color: Colors.red,),
                            SizedBox(width: 5,),
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
}
