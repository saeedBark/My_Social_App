import 'package:flutter/material.dart';

class CoverAndImageWidget extends StatelessWidget {
 final String cover;
 final String image;
  const CoverAndImageWidget({ required this.image,required this.cover,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 200,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image:  DecorationImage(
                      image: NetworkImage(
                        cover,
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
               image,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
