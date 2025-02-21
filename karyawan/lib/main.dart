import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karyawan/models/karyawan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daftar Karyawan",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  Future<List<Karyawan>> _readJsonData() async {
    String response = await rootBundle.loadString("assets/karyawan.json");
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Karyawan.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Daftar Karyawan"),
      ),
      body: FutureBuilder<List<Karyawan>>(
        future: _readJsonData(),
        builder: (context, snapshot) {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
