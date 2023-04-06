import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/cubit/layout/cubit.dart';
import 'package:my_social_app/cubit/layout/state.dart';
import 'package:my_social_app/models/user_model.dart';
import 'package:my_social_app/view/screens/edite_profile_screen.dart';
import 'package:my_social_app/view/wedget/default_text.dart';

import '../../wedget/navigatorPage/navigator_page.dart';

class SettingScreen extends StatelessWidget {
   SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var userModel = LayoutCubit.get(context).userModel;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
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
                              userModel!.cover!,
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
                      userModel!.image!,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          DefaultText(text: userModel!.name!,style: Theme.of(context).textTheme.titleLarge,),
          const SizedBox(height: 10,),
          DefaultText(text: userModel!.bio!,style: Theme.of(context).textTheme.titleLarge,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                     DefaultText(text: '100',style: Theme.of(context).textTheme.titleLarge,),
                     DefaultText(text: 'Posts',style: Theme.of(context).textTheme.caption,),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                     DefaultText(text: '420',style: Theme.of(context).textTheme.titleLarge,),
                     DefaultText(text: 'photos',style: Theme.of(context).textTheme.caption,),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                     DefaultText(text: '20k',style: Theme.of(context).textTheme.titleLarge,),
                     DefaultText(text: 'Followers',style: Theme.of(context).textTheme.caption,),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                     DefaultText(text: '50',style: Theme.of(context).textTheme.titleLarge,),
                     DefaultText(text: 'Followings',style: Theme.of(context).textTheme.caption,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(child: OutlinedButton(onPressed: (){}, child: Text('Add photo '))),
              SizedBox(width: 5,),
              OutlinedButton(onPressed: (){
                navigatorTo(context,EditProfileScreen());
              }, child: Icon(Icons.edit)),
            ],
          ),

        ],
      ),
    );
  },
);
  }
}
