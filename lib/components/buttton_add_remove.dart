import 'package:flutter/material.dart';

class ButtonAddRemove extends StatelessWidget {
  const ButtonAddRemove(
      {required this.onChanged, required this.icon, super.key});

  final IconData icon;
  final Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      margin: const EdgeInsets.all(0.0),
      width: 70,
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        color: Colors.amberAccent,
      ),
      child: IconButton(padding: const EdgeInsets.all(0.0),
        color: Colors.black,
        onPressed: onChanged,
        icon: Icon(
          icon,
          size: 35,
        ),
      ),
    );
  }
}
