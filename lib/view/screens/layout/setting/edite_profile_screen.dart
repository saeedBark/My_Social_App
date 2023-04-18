import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_social_app/cubit/layout/cubit.dart';
import 'package:my_social_app/cubit/layout/state.dart';
import 'package:my_social_app/utils/style.dart';
import 'package:my_social_app/view/widget/default_bottom.dart';

import '../../../../components/colors.dart';
import '../../../widget/default_text_form_file.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final nameController = TextEditingController();
        final phoneController = TextEditingController();
        final bioController = TextEditingController();

        var cubit = LayoutCubit.get(context);
        var userModel = LayoutCubit.get(context).userModel;
        var imageProfile = LayoutCubit.get(context).imageProfile;
        var coverProfile = LayoutCubit.get(context).coverProfile;

        nameController.text = userModel!.name!;
        bioController.text = userModel.bio!;
        phoneController.text = userModel.phone!;

        var model = LayoutCubit.get(context).userModel;
        return Scaffold(
          appBar: AppBar(
            title:  Text('Edit Profile',style: Styles.textStyle16,),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  cubit.updateDataUser(
                    name: nameController.text,
                    bio: bioController.text,
                    phone: phoneController.text,
                  );
                  //cubit.uploadCoverProfile();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    'Update',
                    style: Styles.textStyle16,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all( 10),
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
                                        image: coverProfile == null
                                            ? NetworkImage(
                                                model!.cover!,
                                              )
                                            : FileImage(coverProfile)
                                                as ImageProvider,
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
                                      onPressed: () {
                                        cubit.getCoverFrofile();
                                      },
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
                                backgroundImage: imageProfile == null
                                    ? NetworkImage(
                                        model!.image!,
                                      )
                                    : FileImage(imageProfile) as ImageProvider,
                              ),
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
                                  onPressed: () {
                                    cubit.getImageProfile();
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
                  Row(
                    children: [
                      if (cubit.imageProfile != null)
                        Expanded(
                            child: Column(
                          children: [
                            DefaultBottom(
                              function: () {
                                cubit.uploadImageProfile(
                                  name: nameController.text,
                                  bio: bioController.text,
                                  phone: phoneController.text,
                                );
                              },
                              color: defaultColor,
                              text: 'Upload Image',
                            ),
                            if(state is LayoutGetAllUserLoadingState)
                            const SizedBox(
                              height: 5,
                            ),
                            if(state is LayoutGetAllUserLoadingState)
                            const LinearProgressIndicator(),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        )),
                      const SizedBox(
                        width: 8,
                      ),
                      if (cubit.coverProfile != null)
                        Expanded(
                            child: Column(
                          children: [
                            DefaultBottom(
                              function: () {
                                cubit.uploadCoverProfile(
                                  name: nameController.text,
                                  bio: bioController.text,
                                  phone: phoneController.text,
                                );
                              },
                              text: 'Upload cover',
                              color: defaultColor,
                            ),
                            if(state is LayoutGetAllUserLoadingState)
                            const SizedBox(
                              height: 5,
                            ),
                            if(state is LayoutGetAllUserLoadingState)
                            const LinearProgressIndicator(),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultFromFile(
                    controller: nameController,
                    lable: 'name',
                    prefix: Icons.person_outline,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultFromFile(
                    controller: bioController,
                    lable: 'bio',
                    prefix: Icons.info_outline,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultFromFile(
                    controller: phoneController,
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
