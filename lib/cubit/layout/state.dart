
abstract class LayoutState {}

class LayoutInitialState extends LayoutState {}
///////// get all users
class LayoutGetAllUserLoadingState extends LayoutState {}

class LayoutGetAllUserSuccessState extends LayoutState {}

class LayoutGetAllUserErrorState extends LayoutState {}
///////////// get all user for chat
class LayoutGetAllUserChatSuccessState extends LayoutState {}

class LayoutGetAllUserChatErrorState extends LayoutState {}
////// change bottom ////////

class LayoutChangeBottomState extends LayoutState {}

///////////////// get image profile /////

class LayoutPickeImageProfileSuccessState extends LayoutState {}

class LayoutPickeImageProfileErrorState extends LayoutState {}

/////////// get cover profile ///////
class LayoutPickeCoverProfileSuccessState extends LayoutState{}

class LayoutPickeCoverProfileErrorState extends LayoutState{}
///////////// upload image Profile
class LayoutUploadImageProfileSuccessState extends LayoutState{}

class LayoutUploadImageProfileErrorState extends LayoutState{}

/////////// upload cover Profile
class LayoutUploadCoverProfileSuccessState extends LayoutState{}

class LayoutUploadCoverProfileErrorState extends LayoutState{}

/////// update data user ////////
class LayoutUpdateDataUserSuccessState extends LayoutState{}

class LayoutUpdateDataUserErrorState extends LayoutState{}

///////// Picke post //////

class LayoutPickeImagePostSuccessState extends LayoutState{}

class LayoutPickeImagePostErrorState extends LayoutState{}

//////// upload data post with out image post
class LayoutUpdateDataPostLoadingState extends LayoutState{}

class LayoutUpdateCreatePostSuccessState extends LayoutState{}

class LayoutUpdateCreatePostErrorState extends LayoutState{}

///////// upload image post with data

class LayoutUploadImagePostSuccessState extends LayoutState{}

class LayoutUploadImagePostErrorState extends LayoutState{}
///////// remove image picker
class LayoutRemoveImagePickerState extends LayoutState{ }

////// get all posts

class LayoutGetAllPostSuccessState extends LayoutState{}

class LayoutGetAllPostErrorState extends LayoutState{}

////////// like post
class LayoutLikePostSuccessState extends LayoutState{}

class LayoutLikePostErrorState extends LayoutState{
  late final String error;
  LayoutLikePostErrorState(this.error);
}

///////// send message
class LayoutSendMessageSuccessState extends LayoutState{}

class LayoutSendMessageErrorState extends LayoutState{
  late final String error;
  LayoutSendMessageErrorState(this.error);
}
///////// get messages
class LayoutGetMessageSuccessState extends LayoutState{}