class StudentProfile {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? imageURL;
  String? description;

  StudentProfile(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.imageURL,
      this.description});

  StudentProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    imageURL = json['imageURL'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['imageURL'] = imageURL;
    data['description'] = description;
    return data;
  }
}
