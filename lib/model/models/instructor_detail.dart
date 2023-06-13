class InstructorDetail {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? imageURL;
  List<Courses>? courses;

  InstructorDetail(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.imageURL,
      this.courses});

  InstructorDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    imageURL = json['imageURL'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['imageURL'] = imageURL;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  int? id;
  String? name;
  int? creditHours;

  Courses({this.id, this.name, this.creditHours});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    creditHours = json['credit_hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['credit_hours'] = creditHours;
    return data;
  }
}
