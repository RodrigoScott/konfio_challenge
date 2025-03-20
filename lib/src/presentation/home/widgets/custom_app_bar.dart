import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar {
  customApp(BuildContext context, Size size) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, kToolbarHeight),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
            child: Text(
          'Dogs We Love',
          style: TextStyle(
              fontSize: size.width * .08,
              fontWeight: FontWeight.w400,
              color: const Color(0xff333333)),
        )),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              showExitDialog(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          )
        ],
      ),
    );
  }

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
                      child: const Text('Aceptar', style: TextStyle(color: Color(0xff383838)),),
                      onPressed: () {
                        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                      },
                    ),
                    TextButton(
                      child: const Text('Cancelar', style: TextStyle(color: Color(0xff383838)),),
                      onPressed: () {
                        Navigator.of(dialogContext)
                            .pop(); // Dismiss alert dialog
                      },
                    ),
                  ],
                );
              },
            );
  }
}
