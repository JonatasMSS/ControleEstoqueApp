import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/DataByDay/DataByDay.dart';
import 'package:genilson_app/components/InputSearchComponent/InputSearchComponent.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';

class FazerPedidoPage extends StatelessWidget {
  const FazerPedidoPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> dateWidget = const [
      DataByDay(
        title: 'Terça-feira',
      ),
      SizedBox(
        height: 30,
      ),
      DataByDay(
        title: 'Quarta-feira',
      ),
      SizedBox(
        height: 30,
      ),
      DataByDay(
        title: 'Quinta-feira',
      ),
      SizedBox(
        height: 30,
      ),
      DataByDay(
        title: 'Sexta-feira',
      ),
      SizedBox(
        height: 30,
      ),
    ];

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus
          ?.unfocus(), // Desfocar ao clicar na tela,
      child: Scaffold(
        backgroundColor: const Color(0xFFE4E4E4),
        appBar: NavBarComponent(NavBarTitle: 'Realizar Pedidos'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const InputSearchComponent(
                hintText: 'Digite o nome do cliente',
              ),
              ...dateWidget,
            ],
          ),
        ),
      ),
    );
  }
}
