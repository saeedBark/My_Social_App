
abstract class LayoutState {}

class LayoutInitialState extends LayoutState {}

class LayoutGetAllUserLoadingState extends LayoutState {}

class LayoutGetAllUserSuccessState extends LayoutState {}

class LayoutGetAllUserErrorState extends LayoutState {}

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