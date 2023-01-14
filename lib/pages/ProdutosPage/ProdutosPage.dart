import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:genilson_app/components/InputSearchComponent/InputSearchComponent.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';
import 'package:genilson_app/components/ProductComponent/ProductComponent.dart';
import 'package:genilson_app/models/ProductModel/ProductModel.dart';
import 'package:genilson_app/pages/ProdutosPage/Dialogs/edit_product_dialog.dart';
import 'package:genilson_app/pages/ProdutosPage/Dialogs/product_add_dialog.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
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

  late List<ProductModel> testDatabase;

  @override
  void initState() {
    testDatabase = [
      ProductModel(id: 0, name: 'BOKUS', price: 3.50, quantity: 2),
      ProductModel(id: 1, name: 'TRELOSO', price: 2.50, quantity: 10),
      ProductModel(id: 2, name: 'PACOCA', price: 10.50, quantity: 5),
    ];
    // TODO: implement initState
    super.initState();
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
            const InputSearchComponent(
              hintText: 'Digite o nome do produto',
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: testDatabase.length,
              itemBuilder: (context, index) {
                final ProductModel produto = testDatabase[index];
                return ProductComponent(
                    produto: produto,
                    isEditable: true,
                    onClickEdit: () => editProduct(context, produto),
                    onClickRemove: () {
                      setState(() {
                        testDatabase.removeAt(index);
                      });
                    });
              },
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
