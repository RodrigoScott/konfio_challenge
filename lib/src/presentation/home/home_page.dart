import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konfio_challenge/src/domain/bloc/pet_bloc/pet_cubit.dart';
import 'package:konfio_challenge/src/presentation/home/home_page_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PetCubit()..getPet(),
      child: const HomePageView(),
    );
  }
}
