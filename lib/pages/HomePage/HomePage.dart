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
  late bool isLoading;
  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      appBar: NavBarComponent(NavBarTitle: 'MStocker'),
      body: !isLoading
          ? Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
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
                        onClick: () async {
                          setState(() {
                            isLoading = true;
                          });

                          await Get.toNamed('/pedidos');
                          setState(() {
                            isLoading = false;
                          });
                        },
                        description: "Fazer pedido",
                        imageLocation: 'lib/assets/images/IconPedido.png',
                      ),
                      BigIconButton(
                        onClick: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await Get.toNamed('/clientes');
                          setState(() {
                            isLoading = false;
                          });
                        },
                        imageLocation: 'lib/assets/images/IconClient.png',
                        description: "Clientes",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BigIconButton(
                        imageLocation: 'lib/assets/images/IconProducts.png',
                        description: 'Meus produtos',
                        onClick: () {
                          setState(() {
                            isLoading = true;
                          });
                          Get.toNamed('/produtos');
                          setState(() {
                            isLoading = false;
                          });
                        },
                      ),
                      BigIconButton(
                        imageLocation: 'lib/assets/images/IconConfig.png',
                        description: 'Configurações',
                        onClick: () async {
                          setState(() {
                            isLoading = true;
                          });
                          await Get.toNamed('/configPage');
                          setState(() {
                            isLoading = false;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
