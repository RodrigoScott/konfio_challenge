import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konfio_challenge/src/presentation/home/widgets/widgets.dart';

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
              Dialogs().showExitDialog(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
                onPressed: () {
                  Dialogs().showDeleteBd(context);
                },
                icon: const Icon(Icons.delete)),
          )
        ],
      ),
    );
  }
}
