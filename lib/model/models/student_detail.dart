class StudentDetail {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? batchYear;
  String? imagePath;
  List<Courses>? courses;

  StudentDetail(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.batchYear,
      this.imagePath,
      this.courses});

  StudentDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    batchYear = json['batch_year'];
    imagePath = json['imagePath'];
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
    data['batch_year'] = batchYear;
    data['imagePath'] = imagePath;
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
  String? instructorName;
  int? instructorId;
  String? thumbnailURL;

  Courses(
      {this.id,
      this.name,
      this.creditHours,
      this.instructorName,
      this.instructorId,
      this.thumbnailURL});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    creditHours = json['credit_hours'];
    instructorName = json['instructor_name'];
    instructorId = json['instructor_id'];
    thumbnailURL = json['thumbnailURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['credit_hours'] = creditHours;
    data['instructor_name'] = instructorName;
    data['instructor_id'] = instructorId;
    data['thumbnailURL'] = thumbnailURL;
    return data;
  }
}
