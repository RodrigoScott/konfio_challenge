import 'package:konfio_challenge/src/domain/models/pet/pet_model.dart' as model;
import 'package:flutter_test/flutter_test.dart';
import 'package:konfio_challenge/src/data/database/database_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {
  group('Database tests', () {
  Database? db;
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  setUpAll(() {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory
    databaseFactory = databaseFactoryFfi;
  });
  setUp(() async {
    db = await openDatabase(inMemoryDatabasePath);
    db?.execute(DatabaseHelper.databaseQueryPets);
  });
    tearDown(() async {
      await db?.close();
      db = null;
    });

    test('Create Pet Object', () async {
      final List<model.PetModel> pets = [
        model.PetModel(
          image: 'https://placedog.net/357/535',
          description:
              'He is much more passive and is the first to suggest to rescue and not eat The Little Pilot',
          age: 5,
          dogName: 'Rex',
        )
      ];
      bool? insertedRecordId = await dbHelper.insertPets(pets, db!);
      expect(insertedRecordId, isNotNull);
    });

    test('Read pets record', () async {
      List<Map<String, Object?>> records =
          await db!.query(DatabaseHelper.tableName);
      expect(records, isNotNull);
    });

    test('Delete pets record', () async {
      int deletedRowCount = await dbHelper.deletePetList(db!);
      expect(deletedRowCount, 0);
    });
  });
}
