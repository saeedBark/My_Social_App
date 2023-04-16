import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/cubit/layout/cubit.dart';
import 'package:my_social_app/cubit/layout/state.dart';
import 'package:my_social_app/view/screens/layout/setting/edite_profile_screen.dart';
import 'package:my_social_app/view/widget/setting/cover_and_image_widget.dart';
import '../../../widget/default_text.dart';
import '../../../widget/navigatorPage/navigator_page.dart';

class SettingScreen extends StatelessWidget {
   const SettingScreen({Key? key}) : super(key: key);

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
          CoverAndImageWidget(image: userModel!.image!, cover: userModel.cover!),
          const SizedBox(height: 10,),
          DefaultText(text: userModel.name!,style: Theme.of(context).textTheme.titleLarge,),
          const SizedBox(height: 10,),
          DefaultText(text: userModel.bio!,style: Theme.of(context).textTheme.titleLarge,),
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
              Expanded(child: OutlinedButton(onPressed: (){}, child: const Text('Add photo '))),
              const SizedBox(width: 5,),
              OutlinedButton(onPressed: (){
                navigatorTo(context,const EditProfileScreen());
              }, child: const Icon(Icons.edit)),
            ],
          ),
          const SizedBox(height: 25,),
          Row(
      
            children: [
              Expanded(
                child: OutlinedButton(onPressed: (){
                  FirebaseMessaging.instance.subscribeToTopic('announce');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green.withOpacity(0.8)
                ), child:  const Text('Subscribe',style: TextStyle(color: Colors.white),),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: OutlinedButton(onPressed: (){
                  FirebaseMessaging.instance.unsubscribeFromTopic('announce');
                },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.red.withOpacity(0.8)
                  ), child: const Text('Unsubscribe',style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          )

        ],
      ),
    );
  },
);
  }
}
