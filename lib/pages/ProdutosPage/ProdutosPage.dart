import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/InputSearchComponent/InputSearchComponent.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';
import 'package:genilson_app/components/ProductComponent/ProductComponent.dart';
import 'package:genilson_app/models/ProductModel/ProductModel.dart';
import 'package:genilson_app/pages/ProdutosPage/Dialogs/edit_product_dialog.dart';
import 'package:genilson_app/pages/ProdutosPage/Dialogs/product_add_dialog.dart';

final ProductModel produto =
    ProductModel(id: 0, name: 'TRELOSO', price: 23.50, quantity: 10);

class ProdutosPage extends StatelessWidget {
  ProdutosPage({super.key});
  final TextEditingController myText = TextEditingController();

  void editProduct(BuildContext context, ProductModel model) {
    showDialog(
      context: context,
      builder: (context) {
        return EditDialog(
          produto: model,
        );
      },
    );
  }

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
          children: [
            InputSearchComponent(
              hintText: 'Digite o nome do produto',
            ),
            ProductComponent(
              produto: produto,
              onClickEdit: () => editProduct(context, produto),
            ),
          ],
        ),
      ),
    );
  }
}
