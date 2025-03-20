import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:konfio_challenge/src/domain/models/models.dart';

class PetService {
  Future<List<PetModel>?> getPetsList() async {
    List<PetModel>? petList;
    http.Response response = await http.get(
      Uri.parse('https://jsonblob.com/api/1352326525529284608'),
    );
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      petList = petModelFromJson(body);
    }
    return petList;
  }
}
