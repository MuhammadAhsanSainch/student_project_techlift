class InstructorList {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? imageURL;

  InstructorList({this.id, this.name, this.email, this.phone, this.imageURL});

  InstructorList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    imageURL = json['imageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['imageURL'] = imageURL;
    return data;
  }
}
