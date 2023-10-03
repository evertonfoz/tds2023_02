import 'package:flutter/material.dart';

import '../homepage/homepage.dart';
import '../product_type/homepage.dart';

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TDS Frontend',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/', // Define a página inicial
      routes: {
        '/': (context) => const HomePage(), // Sua página inicial
        '/productTypeCRUD': (context) =>
            const ProductTypeCRUD(), // A página que você deseja navegar
      },
    );
  }
}
