import 'package:flutter/material.dart';
import 'package:keychaintest/home.dart';
import 'package:keychaintest/storage_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storageManager = StorageManager();
  await storageManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'storage demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
