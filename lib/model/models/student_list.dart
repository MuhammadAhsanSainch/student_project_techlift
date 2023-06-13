class StudentList {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? batchYear;
  String? imageURL;

  StudentList(
      {this.id = 0,
      this.name,
      this.email,
      this.phone = "03023880430",
      this.batchYear = "2022",
      this.imageURL = ""});

  StudentList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    batchYear = json['batch_year'];
    imageURL = json['imageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['batch_year'] = batchYear;
    data['imageURL'] = imageURL;
    return data;
  }
}
