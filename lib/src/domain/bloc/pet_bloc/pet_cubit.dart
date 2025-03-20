import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:konfio_challenge/src/domain/models/models.dart';

import '../../services/services.dart';

part 'pet_state.dart';

class PetCubit extends Cubit<PetState> {
  PetCubit() : super(PetInitial());

  Future<void> getPet() async {
    emit(PetLoading());
    List<PetModel>? petList = await PetService().getPetsList();
    emit(PetLoaded(pets: petList));
  }
}
