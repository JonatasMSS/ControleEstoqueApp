import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/InputSearchComponent/InputSearchComponent.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';
import 'package:genilson_app/components/ProductComponent/ProductComponent.dart';
import 'package:genilson_app/pages/ProdutosPage/Dialogs/product_add_dialog.dart';

class ProdutosPage extends StatelessWidget {
  const ProdutosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6AFF79),
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const ProductAddDialog();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: NavBarComponent(
        NavBarTitle: 'Meus produtos',
      ),
      backgroundColor: const Color(0xFFE4E4E4),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            InputSearchComponent(
              hintText: 'Digite o nome do produto',
            ),
            ProductComponent(),
          ],
        ),
      ),
    );
  }
}
