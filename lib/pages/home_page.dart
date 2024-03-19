import 'package:f_count_aula/components/buttton_add_remove.dart';
import 'package:f_count_aula/components/display.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  String _message = "";
  bool isEnableAdd = true;
  bool isEnableRemove = false;

  void _changeCount(int delta) {
    setState(() {
      _counter += delta;
      if (_counter > 0 && _counter < 25) {
        delta > 0 ? _message = "+1" : _message = "-1";
        isEnableRemove = true;
        isEnableAdd = true;
      } else if (_counter >= 25) {
        _counter = 25;
        isEnableAdd = false;
      } else {
        _counter = 0;
        isEnableRemove = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
            constraints: const BoxConstraints.expand(),
            color: Colors.amber,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Display(
                  counter: _counter,
                  showMessage: false,
                  message: "",
                ),
                // child: Text(
                //   _message,
                //   style: const TextStyle(
                //     color: Colors.white,
                //   ),
                // ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white70,
            constraints: const BoxConstraints.expand(),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    margin: const EdgeInsets.all(0.0),
                    child: Display(
                      counter: _counter,
                      showMessage: true,
                      message: _message,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ButtonAddRemove(
                        onChanged: isEnableAdd
                            ? () async {
                                _changeCount(1);
                                await Future.delayed(
                                    const Duration(milliseconds: 500));
                                setState(() {
                                  _message = "";
                                });
                              }
                            : null,
                        icon: Icons.add,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ButtonAddRemove(
                        onChanged: isEnableRemove
                            ? () async {
                                _changeCount(-1);
                                await Future.delayed(
                                    const Duration(milliseconds: 500));
                                setState(() {
                                  _message = "";
                                });
                              }
                            : null,
                        icon: Icons.remove,
                      )
                    ],
                  ),
                  const SizedBox(height: 100,),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
