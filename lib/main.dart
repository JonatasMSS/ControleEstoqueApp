import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genilson_app/pages/ClientesPage/ClientesPage.dart';
import 'package:genilson_app/pages/FazerPedidoPage/FazerPedidoPage.dart';
import 'package:genilson_app/pages/HomePage/HomePage.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Roboto-Condensed'),
      initialRoute: '/',
      transitionDuration: const Duration(milliseconds: 500),
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/clientes', page: () => const ClientesPage()),
        GetPage(name: '/pedidos', page: () => const FazerPedidoPage())
      ],
    );
  }
}
