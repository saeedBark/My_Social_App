import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../wedget/feed/feed_widget.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context,index) {
        return  FeedWidget();
      },
      separatorBuilder: (context,index) => const SizedBox(height: 10,),
      itemCount: 5,
    );
  }
}
