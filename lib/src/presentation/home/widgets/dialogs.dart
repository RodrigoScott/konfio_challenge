import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konfio_challenge/src/domain/bloc/pet_bloc/pet_cubit.dart';
import 'package:konfio_challenge/src/domain/repositories/pet_repository/pet_repository.dart';

class Dialogs {
  Future<void> showExitDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFFfefffe),
          title: const Text('¡Espera!'),
          content: const Text('¿Seguro que quieres salir de la aplicación?'),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Aceptar',
                style: TextStyle(color: Color(0xff383838)),
              ),
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Color(0xff383838)),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showDeleteBd(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          alignment: Alignment.center,
          backgroundColor: const Color(0xFFfefffe),
          title: const Text('¡Espera!'),
          content: const Text(
              'Al realizar esta acción se reiniciará tu base de datos.\n\n¿Seguro que deseas continuar?'),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Aceptar',
                style: TextStyle(color: Color(0xff383838)),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                PetRepository().deletePets();
                context.read<PetCubit>().getPet();
              },
            ),
            TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Color(0xff383838)),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }
}
