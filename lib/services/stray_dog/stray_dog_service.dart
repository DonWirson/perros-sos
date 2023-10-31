import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../models/stray_dog_model.dart';
import 'stray_dog_interface.dart';

class StrayDogService extends StrayDogInterface {
  static final String baseUrl = dotenv.env['API_URL']!;

  @override
  Future<List<StrayDogModel>> getAllStrayDogs() async {
    const endPoint = "/stray-dogs/";
    try {
      List<StrayDogModel> strayDogs = [];
      final response = await http.get(
        Uri.parse(baseUrl + endPoint),
      );
      final decodedBody = jsonDecode(response.body);
      for (var strayDogMap in decodedBody) {
        strayDogs.add(
          StrayDogModel.fromJson(strayDogMap),
        );
      }
      return strayDogs;
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  @override
  Future<StrayDogModel> getOneStrayDog({required String endPoint}) async {
    final response = await http.get(Uri.parse(baseUrl + endPoint));
    return StrayDogModel.fromJson(jsonDecode(response.body));
  }
}
