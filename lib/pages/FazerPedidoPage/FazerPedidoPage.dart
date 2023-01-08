import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/InputSearchComponent/InputSearchComponent.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';

class FazerPedidoPage extends StatelessWidget {
  const FazerPedidoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      appBar: NavBarComponent(NavBarTitle: 'Realizar Pedidos'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputSearchComponent(),
          ],
        ),
      ),
    );
  }
}
