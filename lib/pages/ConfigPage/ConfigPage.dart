import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/SimpleButtonC/SimpleButtonC.dart';
import 'package:get/get.dart';

import '../../components/NavBar/NavBarComponent.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      appBar: NavBarComponent(NavBarTitle: 'Configurações'),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Resetar todos os clientes"),
                        content: const Text(
                          'Tem certeza que deseja deletar todos os clientes?',
                          style: TextStyle(color: Colors.red),
                        ),
                        actionsAlignment: MainAxisAlignment.spaceAround,
                        actions: [
                          const SimpleButtonC(
                            text: "Sim",
                          ),
                          SimpleButtonC(
                            text: "Não!",
                            primary: true,
                            onClick: () => Get.back(),
                          ),
                        ],
                      );
                    });
              },
              leading: const CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.person_off_rounded,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Resetar todos os clientes",
                textScaleFactor: 1.5,
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Resetar todos os produtos"),
                        content: const Text(
                          'Tem certeza que deseja zerar todos os valores dos produtos?',
                          style: TextStyle(color: Colors.red),
                        ),
                        actionsAlignment: MainAxisAlignment.spaceAround,
                        actions: [
                          const SimpleButtonC(
                            text: "Sim",
                          ),
                          SimpleButtonC(
                            text: "Não!",
                            primary: true,
                            onClick: () => Get.back(),
                          ),
                        ],
                      );
                    });
              },
              leading: const CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.remove_shopping_cart_rounded,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Resetar todos os produtos para o padrão",
                textScaleFactor: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
