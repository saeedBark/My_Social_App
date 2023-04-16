import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_social_app/cubit/layout/state.dart';
import 'package:my_social_app/models/message_model.dart';
import 'package:my_social_app/view/screens/layout/new_post_screen.dart';
import 'package:my_social_app/view/widget/navigatorPage/navigator_page.dart';
import '../../components/component.dart';
import '../../models/post_model.dart';
import '../../models/user_model.dart';
import '../../view/screens/layout/chat/chat.dart';
import '../../view/screens/layout/feed.dart';
import '../../view/screens/layout/setting/setting.dart';
import '../../view/screens/layout/users.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  void getAllUser() {
    emit(LayoutGetAllUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());

      userModel = UserModel.formJson(value.data()!);

      print(userModel!.name);

      emit(LayoutGetAllUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutGetAllUserErrorState());
    });
  }

  int currendIndex = 0;

  void changeBottom(int index, context) {
    if (index == 1) {
      getAllChatUser();
    }
    if (index == 2) {
      navigatorTo(context, NewPostScreen());
    } else {
      currendIndex = index;
      emit(LayoutChangeBottomState());
    }
  }

  List<Widget> screens = [
    FeedScreen(),
    ChatScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingScreen(),
  ];
  List<String> title = [
    'Home',
    'Chat',
    'Post',
    'Users',
    'Setting',
  ];
  List<BottomNavigationBarItem> bottomNavigaton = const [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Feed'),
    BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: 'Chat'),
    BottomNavigationBarItem(icon: Icon(Icons.post_add_outlined), label: 'Post'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined), label: 'Setting'),
  ];

  File? imageProfile;
  var picker = ImagePicker();
  Future<void> getImageProfile() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageProfile = File(pickedFile.path);
      emit(LayoutPickeImageProfileSuccessState());
    } else {
      emit(LayoutPickeImageProfileErrorState());
    }
  }

  File? coverProfile;
  Future<void> getCoverFrofile() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      coverProfile = File(pickedFile.path);
      emit(LayoutPickeCoverProfileSuccessState());
    } else {
      emit(LayoutPickeCoverProfileErrorState());
    }
  }

  // String? uploadImageProfil = '';
  void uploadImageProfile({
    required name,
    required bio,
    required phone,
  }) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(imageProfile!.path).pathSegments.last}')
        .putFile(imageProfile!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // uploadImageProfil = value;
        updateDataUser(
          name: name,
          bio: bio,
          phone: phone,
          image: value,
        );
        print(value);
        //   emit(LayoutUploadImageProfileSuccessState());
      }).catchError((error) {
        emit(LayoutUploadImageProfileErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(LayoutUploadImageProfileErrorState());
    });
  }

  //String? uploadCoverProfil = '';
  void uploadCoverProfile({
    required name,
    required bio,
    required phone,
  }) {
    emit(LayoutGetAllUserLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverProfile!.path).pathSegments.last}')
        .putFile(coverProfile!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //  uploadCoverProfil = value;
        updateDataUser(
          name: name,
          bio: bio,
          phone: phone,
          cover: value,
        );
        print(value);
        //    emit(LayoutUploadCoverProfileSuccessState());
      }).catchError((error) {
        emit(LayoutUploadCoverProfileErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(LayoutUploadCoverProfileErrorState());
    });
  }

  void updateDataUser({
    required name,
    required bio,
    required phone,
    String? cover,
    String? image,
  }) {
    UserModel model = UserModel(
      name: name,
      bio: bio,
      phone: phone,
      uid: userModel!.uid,
      cover: cover ?? userModel!.cover,
      image: image ?? userModel!.image,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uid)
        .update(model.toMap())
        .then((value) {
      getAllUser();
    }).catchError((error) {
      print(error.toString());
      emit(LayoutUpdateDataUserErrorState());
    });
  }

  File? imagePostPicke;
  Future<void> getImagePost() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePostPicke = File(pickedFile.path);
      emit(LayoutPickeImagePostSuccessState());
    } else {
      emit(LayoutPickeImagePostErrorState());
    }
  }

  // String? uploadImageProfil = '';
  void uploadImagePost({
    required String textPost,
    String? imagePost,
    required String datePost,
  }) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(imagePostPicke!.path).pathSegments.last}')
        .putFile(imagePostPicke!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // uploadImageProfil = value;
        uploadCreatePost(
          textPost: textPost,
          datePost: datePost,
          imagePost: value,
        );
        print(value);
        //   emit(LayoutUploadImageProfileSuccessState());
      }).catchError((error) {
        emit(LayoutUploadImageProfileErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(LayoutUploadImageProfileErrorState());
    });
  }

  void removeImagePicke() {
    imagePostPicke = null;
    emit(LayoutRemoveImagePickerState());
  }

  void uploadCreatePost({
    required String textPost,
    required String datePost,
    String? imagePost,
  }) {
    emit(LayoutUpdateDataPostLoadingState());

    PostModel model = PostModel(
      name: userModel!.name,
      image: userModel!.image,
      uid: userModel!.uid,
      imagePost: imagePost ?? '',
      textPost: textPost,
      datePost: datePost,
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
      emit(LayoutUpdateCreatePostSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LayoutUpdateCreatePostErrorState());
    });
  }

  List<String> postId = [];
  List<PostModel> posts = [];
  List<int> likes = [];
  void getAllPosts() {
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        element.reference.collection('likes').get().then((value) {
          likes.add(value.docs.length);
          postId.add(element.id);
          posts.add(PostModel.formJson(element.data()));
        }).catchError((error) {
          print(error.toString());
        });

        // print(element.data());
      });
      emit(LayoutGetAllPostSuccessState());
    }).catchError((error) {
      emit(LayoutGetAllPostErrorState());
    });
  }

  void likePost(postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel!.uid)
        .set({'like': true}).then((value) {
      emit(LayoutLikePostSuccessState());
    }).catchError((error) {
      emit(LayoutLikePostErrorState(error.toString()));
    });
  }

  List<UserModel> users = [];
  void getAllChatUser() {
    if (users.isEmpty) {
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
          if (element.data()['uid'] != userModel!.uid!) {
            users.add(UserModel.formJson(element.data()));
          }
        });
        emit(LayoutGetAllUserChatSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(LayoutGetAllUserChatErrorState());
      });
    }
  }

  void sendMessage({
    required String receiveId,
    required String textMessage,
    required String dateTime,
  }) {
    MessageModel model = MessageModel(
      sendId: userModel!.uid!,
      receiveId: receiveId,
      textMessage: textMessage,
      dateTime: dateTime,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uid)
        .collection('chats')
        .doc(receiveId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(LayoutSendMessageSuccessState());
    }).catchError((error) {});

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiveId)
        .collection('chats')
        .doc(userModel!.uid)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(LayoutSendMessageSuccessState());
    }).catchError((error) {
      emit(LayoutSendMessageErrorState(error.toString()));
    });
  }
 MessageModel? messageModel;
  List<MessageModel> messageList = [];
  void getMessage({
    required String receiveId,
  }) {

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uid)
        .collection('chats')
        .doc(receiveId)
        .collection('messages')
    .orderBy('dateTime')
        .snapshots()
        .listen((event) {
          messageList = [];
      event.docs.forEach((element) {
        messageList.add(MessageModel.formJson(element.data()));
      });
          emit(LayoutGetMessageSuccessState());
    });

  }
}
