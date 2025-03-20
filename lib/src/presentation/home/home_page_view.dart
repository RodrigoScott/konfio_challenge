import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konfio_challenge/src/domain/bloc/pet_bloc/pet_cubit.dart';
import 'package:konfio_challenge/src/domain/models/models.dart';
import 'package:konfio_challenge/src/presentation/home/widgets/widgets.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar().customApp(size),
      backgroundColor: const Color(0xffF8F8F8),
      body: BlocBuilder<PetCubit, PetState>(builder: (blocContext, state) {
        switch (state.runtimeType) {
          case const (PetLoading):
            return const Center(child: CircularProgressIndicator());
          case const (PetLoaded):
            state as PetLoaded;
            if (state.pets != null && state.pets!.isNotEmpty) {
              List<PetModel>? pets = state.pets;
              return PetList(pets: pets!);
            } else {
              return const Center(
                  child: Text('No se ha podido cargar la información'));
            }
          default:
            return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
