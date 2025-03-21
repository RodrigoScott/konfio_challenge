import 'package:konfio_challenge/src/data/database/database_helper.dart';
import 'package:konfio_challenge/src/domain/models/models.dart';
import 'package:sqflite/sqlite_api.dart';

class PetRepository {
  final DatabaseHelper _databaseHelper;
  late Database db;

  PetRepository() : _databaseHelper = DatabaseHelper.instance;

  Future<bool> insertPets(List<PetModel> pets) async {
    db = await _databaseHelper.database;
    return await _databaseHelper.insertPets(pets, db);
  }

  Future<List<PetModel>?> getAllPets() async {
    db = await _databaseHelper.database;
    return await _databaseHelper.getAllPets(db);
  }


  Future<int> deletePets() async {
    db = await _databaseHelper.database;
    return await _databaseHelper.deletePetList(db);
  }
}