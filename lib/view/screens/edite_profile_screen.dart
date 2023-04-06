import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/cubit/layout/cubit.dart';
import 'package:my_social_app/cubit/layout/state.dart';

import '../wedget/default_text_form_file.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit =LayoutCubit.get(context);
        var userModel = LayoutCubit.get(context).userModel;
        var imageProfile = LayoutCubit.get(context).profileimage;

        nameController.text = userModel!.name!;
        emailController.text = userModel.email!;
       phoneController.text = userModel.phone!;
        var model = LayoutCubit.get(context).userModel;
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile'),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Update',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.blue,
                        fontSize: 22,
                      ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 160,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          model!.cover!,
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, top: 8),
                                child: Container(
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                  model.image!,
                                ),
                              ),
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
                                    cubit.getImage();
                                  },
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  DefaultFromFile(
                    controller: nameController,
                    lable: 'name',
                    prefix: Icons.person_outline,
                  ),
                  const SizedBox(height: 10,),
                  DefaultFromFile(
                    controller:emailController,
                    lable: 'email',
                    prefix: Icons.email,
                  ),
                  const SizedBox(height: 10,),
                  DefaultFromFile(
                    controller:phoneController,
                    lable: 'phone',
                    prefix: Icons.phone,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
