import 'package:http/http.dart' as http;
import 'package:konfio_challenge/src/domain/models/models.dart';
import 'package:konfio_challenge/src/domain/repositories/repositories.dart';

class PetService {
  Future<List<PetModel>?> getPetsList() async {
    List<PetModel>? petList;
    return await PetRepository().getAllPets().then((value) async {
      if (value != null && value.isNotEmpty) {
        petList = value;
      } else {
        http.Response response = await http.get(
          Uri.parse('https://jsonblob.com/api/1352326525529284608'),
        );
        if (response.statusCode == 200) {
          petList = petModelFromJson(response.body);
          await PetRepository().insertPets(petList??[]);
        }
      }
      return petList;
    });
  }
}
