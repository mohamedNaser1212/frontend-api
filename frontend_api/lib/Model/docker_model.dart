class DockerModel {
  String? id;
  String? name;
  String? email;
  String? gender;
  String? age;

  DockerModel({ required this.id, required this.name, required this.email, required this.gender, required this.age});

  DockerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    age = json['age'];
  }

}
