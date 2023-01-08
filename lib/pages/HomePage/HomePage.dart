import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/BigIconButton/BigIconButton.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      appBar: NavBarComponent(NavBarTitle: 'MStocker'),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        height: 500,
        constraints: const BoxConstraints(
          minHeight: 300,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                BigIconButton(
                  onClick: () => Get.toNamed('/pedidos'),
                  description: "Fazer pedido",
                  imageLocation: 'lib/assets/images/IconPedido.png',
                ),
                BigIconButton(
                  onClick: () => Get.toNamed('/clientes'),
                  imageLocation: 'lib/assets/images/IconClient.png',
                  description: "Clientes",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                BigIconButton(
                  imageLocation: 'lib/assets/images/IconProducts.png',
                  description: 'Meus produtos',
                ),
                BigIconButton(
                  imageLocation: 'lib/assets/images/IconConfig.png',
                  description: 'Configurações',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
