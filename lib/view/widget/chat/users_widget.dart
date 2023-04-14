import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({Key? key, required this.image, required this.name}) : super(key: key);
final String image;
final String name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
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
            Text(name,
                style:
                Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
