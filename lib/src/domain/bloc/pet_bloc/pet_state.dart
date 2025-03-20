part of 'pet_cubit.dart';

sealed class PetState extends Equatable {
  const PetState();
}

final class PetInitial extends PetState {
  @override
  List<Object> get props => [];
}

final class PetLoading extends PetState {
  @override
  List<Object> get props => [];
}

final class PetLoaded extends PetState {
  const PetLoaded({
    required this.pets,
  });

  final List<PetModel>? pets;

  PetLoaded copyWith({
    List<PetModel>? pets,
  }) {
    return PetLoaded(pets: pets);
  }

  @override
  List<Object?> get props => [pets];
}

final class PetError extends PetState {
  @override
  List<Object> get props => [];
}
