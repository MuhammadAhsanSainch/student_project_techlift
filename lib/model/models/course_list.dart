class CourseList {
  int? id;
  String? name;
  int? creditHours;
  String? instructorName;
  int? instructorId;
  String? thumbnailURL;

  CourseList(
      {this.id,
      this.name,
      this.creditHours,
      this.instructorName,
      this.instructorId,
      this.thumbnailURL});

  CourseList.fromJson(Map<String, dynamic> json) {
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
