import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:konfio_challenge/src/domain/models/models.dart';
import 'package:konfio_challenge/src/domain/services/services.dart';
import 'package:mockito/mockito.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  MockPetService mockPetService = MockPetService();

  group('Pet Service', () {
    test('Service success', () async {
      when(mockPetService.serviceSuccess())
          .thenAnswer((realInvocation) async => [PetModel()]);
      await mockPetService.serviceSuccess();
      verify(mockPetService.serviceSuccess());
    });

    test('Service failed', () async {
      when(mockPetService.serviceFailed())
          .thenAnswer((realInvocation) async => null);
      await mockPetService.serviceFailed();
      verify(mockPetService.serviceFailed());
    });
  });
}

class MockPetService extends Mock implements PetService {
  MockPetService() {
    throwOnMissingStub(this);
  }

  Future<List<PetModel>?>? serviceSuccess() async =>
      super.noSuchMethod(Invocation.method(#getPetsList, <Object>[]),
          returnValue: Future<List<PetModel>?>.value([PetModel()]));

  Future<List<PetModel>?>? serviceFailed() async =>
      super.noSuchMethod(Invocation.method(#getPetsList, <Object>[]),
          returnValue: Future<List<PetModel>?>.value(null));
}
