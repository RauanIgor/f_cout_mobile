import 'package:f_count_aula/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Contador de Pessoas",
      home: Scaffold(
        backgroundColor: Colors.white70,
        body: Home(),
      ),
    ),
  );
}
