import '../../domain/entities/job.dart';

class JobModel extends Job {
  JobModel({
    required String id,
    required String title,
    required String company,
    required String location,
    required String type,
    required String description,
    required String salary,
    bool isFavorite = false,
  }) : super(
         id: id,
         title: title,
         company: company,
         location: location,
         type: type,
         description: description,
         salary: salary,
         isFavorite: isFavorite,
       );

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      title: json['title'],
      company: json['company'],
      location: json['location'],
      type: json['type'],
      description: json['description'],
      salary: json['salary'] ?? 'Not specified',
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'company': company,
      'location': location,
      'type': type,
      'description': description,
      'salary': salary,
      'isFavorite': isFavorite,
    };
  }
}
