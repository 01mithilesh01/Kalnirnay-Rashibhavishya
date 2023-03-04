import 'package:flutter/material.dart';
import '../Buttons/circleiconbutton.dart';

Expanded rowcreator(
    {required List numbers,
    required BuildContext context,
    required List Names}) {
  return Expanded(
    flex: 10,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        generatoriconbutton(
            imagenumber: numbers[0],
            rad: (MediaQuery.of(context).size.height) / 20,
            context: context,
            name: Names[0]),
        generatoriconbutton(
            imagenumber: numbers[1],
            rad: (MediaQuery.of(context).size.height) / 20,
            context: context,
            name: Names[1]),
        generatoriconbutton(
            imagenumber: numbers[2],
            rad: (MediaQuery.of(context).size.height) / 20,
            context: context,
            name: Names[2]),
      ],
    ),
  );
}
