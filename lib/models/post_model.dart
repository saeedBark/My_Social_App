class PostModel {
  String? name;
  String? uid;
  String? textPost;
  String? image;
  String? imagePost;
  String? datePost;

  PostModel(
      {this.name,
      this.textPost,
      this.imagePost,
      this.uid,
      this.image,
      this.datePost});
  PostModel.formJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    textPost = json['textPost'] ?? '';
    uid = json['uid'] ?? '';
    imagePost = json['imagePost'] ?? '';
    image = json['image'] ?? '';
    datePost = json['datePost'] ?? '';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'textPost': textPost,
      'imagePost': imagePost,
      'uid': uid,
      'image': image,
      'datePost': datePost,
    };
  }
}
