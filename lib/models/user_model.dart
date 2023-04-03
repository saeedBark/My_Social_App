class UserModel {
   String? name;
   String? email;
   String? phone;
   String? uid;


  UserModel({
    this.name,
    this.email,
    this.phone,
      this.uid,
});
  UserModel.formjson(Map<String ,dynamic> json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uid = json['uid'];
  }

   Map<String , dynamic> toMap(){
     return {
       'name' : name,
       'email' : email,
       'phone' : phone,
       'uid' : uid,
       // 'image' : image,
       // 'cover' : cover,
       // 'bio' : bio,
       // 'isEmailVerified' : isEmailVerified,
     };
   }
}
