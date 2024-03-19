import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display(
      {super.key,
      required this.counter,
      required this.showMessage,
      required this.message});

  final int counter;
  final bool showMessage;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: Text(
          showMessage ? message : '$counter',
          key: ValueKey<int>(counter),
          style: TextStyle(
            fontSize: showMessage ? 35 : 48,
            color: showMessage ? Colors.amber : Colors.black,
          ),
        ),
      ),
    );
  }
}
