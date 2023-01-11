import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../components/NavBar/NavBarComponent.dart';

class PedidosToProdutosPage extends StatelessWidget {
  const PedidosToProdutosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      appBar: NavBarComponent(NavBarTitle: 'Realizar Pedidos'),
      body: const Center(
        child: Text('Pedidos to Client'),
      ),
    );
  }
}
