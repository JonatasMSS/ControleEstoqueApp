import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';

class ClientesPage extends StatelessWidget {
  const ClientesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBarComponent(NavBarTitle: 'Meus Clientes'),
      body: Center(
          child: Container(
        child: Text("Center"),
      )),
    );
  }
}
