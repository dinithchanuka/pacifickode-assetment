import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pacifickode/data/models/job_model.dart';

class ApiService {
  static const String baseUrl =
      'https://68b7a8cf73b3ec66cec529c8.mockapi.io/api/v1/job';

  Future<List<JobModel>> fetchJobs() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      try{
        final List<dynamic> data = json.decode(response.body);
        return data.map((item) => JobModel.fromJson(item)).toList();
      }catch(e){
        throw Exception('Something wrong');
      }
    } else {
      throw Exception('Failed to load jobs');
    }
  }
}
