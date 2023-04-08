import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedWidget extends StatelessWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 10,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                'https://plus.unsplash.com/premium_photo-1668383203267-877d4b1feb47?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzN3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.cover,
                height: 180,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1679679008383-6f778fe07828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw5M3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
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
                                  Text('Saeed Bark',
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
                              Text('janur 2023-5-141 5:25:00',
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
                    Text(
                      'This property takes in Color class (final) as the parameter. This property decides the background color of the circle and by default, it is set to ThemeData.primaryColorLight.The child property takes the widget to be placed below the CircleAvatar widget inside the widget tree or the widget to be displayed inside the circle.',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 10),
                          child: Container(
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
                                'https://images.unsplash.com/photo-1680399524789-6af50a3738f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5NHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
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
                                Text('150')
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
                                Text('120 comment')
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
                            'https://images.unsplash.com/photo-1679679008383-6f778fe07828?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw5M3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(child: Text('write a comment....',style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey),)),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: (){},
                            child: Row(
                              children: const [
                                Icon(Icons.favorite_outline,color: Colors.red,),
                                SizedBox(width: 5,),
                                Text('300 like')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
