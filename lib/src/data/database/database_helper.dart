import 'dart:async';
import 'dart:io';
import 'package:konfio_challenge/src/domain/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const databaseName = 'konfio_pet.db';
  static const databaseVersion = 1;
  static const tableName = "pets";
  static const databaseQueryPets = """
              CREATE TABLE $tableName (
                id INTEGER PRIMARY KEY AUTOINCREMENT,              
                dogName TEXT NOT NULL,
                description TEXT NOT NULL,
                age INT NOT NULL,
                image TEXT NOT NULL
              )
            """;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, databaseName);
    _database = await _initDatabase(path);
    return _database!;
  }

  Future<Database> _initDatabase(String path) async {
    return await openDatabase(path,
        version: databaseVersion, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(databaseQueryPets);
  }

  Future close() async {
    final db = await instance.close();
    db.close();
  }

  Future<bool> insertPets(
      List<PetModel> pets, Database dbClient) async {
    for (PetModel val in pets) {
      await dbClient.insert(
          tableName, val.toJson());
    }
    return true;
  }

  Future<List<PetModel>> getAllPets(Database dbClient) async {
    final list = await dbClient.query(tableName);
    return list
        .map<PetModel>((item) => PetModel.fromJson(item))
        .toList();
  }

  Future<int> deletePetList(Database dbClient) async {
    return await dbClient
        .rawDelete('DELETE FROM pets');
  }

}
