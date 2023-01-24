// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:genilson_app/components/InputSearchComponent/InputSearchComponent.dart';
import 'package:genilson_app/components/NavBar/NavBarComponent.dart';
import 'package:genilson_app/components/ProductComponent/ProductComponent.dart';
import 'package:genilson_app/database/ObjectBox.dart';
import 'package:genilson_app/database/eventsBox.dart';
import 'package:genilson_app/main.dart';
import 'package:genilson_app/models/ProductModel/ProductModel.dart';
import 'package:genilson_app/pages/ProdutosPage/Dialogs/edit_product_dialog.dart';
import 'package:genilson_app/pages/ProdutosPage/Dialogs/product_add_dialog.dart';
import 'package:get/get.dart';

class ProdutosPage extends StatefulWidget {
  ObjectBox objectBox;

  ProdutosPage({
    Key? key,
    required this.objectBox,
  }) : super(key: key);

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  late EventsBox eventsBox;

  void editProduct(BuildContext context, ProductModel model) {
    showDialog(
      context: context,
      builder: (context) {
        return EditDialog(
          produto: model,
          eventsBox: eventsBox,
        );
      },
    ).then((value) {
      if (value) {
        Get.snackbar(
          'Produto editado',
          'Produto editado com sucesso!',
          backgroundColor: Colors.amber,
          colorText: Colors.black,
        );
        setState(() {
          produtos = eventsBox.getAllProducts()
            ..sort(
              (a, b) => a.name.compareTo(b.name),
            );
          suggestionDatabase = produtos;
        });
      }
    });
  }

  late List<ProductModel> produtos;
  late List<ProductModel> suggestionDatabase;
  late dynamic test;
  @override
  void initState() {
    eventsBox = EventsBox(boxDatabase: objectBox);
    produtos = eventsBox.getAllProducts();
    produtos = produtos
      ..sort(
        (a, b) => a.name.compareTo(b.name),
      );
    suggestionDatabase = produtos;
    // TODO: implement initState
    super.initState();
  }

  void searchDinamically(String query) {
    final suggestion = produtos.where((produto) {
      final produtoName = produto.name.toUpperCase();
      final input = query.toUpperCase();
      return produtoName.contains(input);
    }).toList();
    setState(() {
      suggestionDatabase = suggestion;
    });
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
              return ProductAddDialog(
                eventsBox: eventsBox,
              );
            },
          ).then((value) {
            if (value) {
              Get.snackbar(
                'Produto adicionado!',
                'Produto adicionado com sucesso!',
                backgroundColor: Colors.blue,
                colorText: Colors.white,
              );
              setState(() {
                produtos = eventsBox.getAllProducts()
                  ..sort(
                    (a, b) => a.name.compareTo(b.name),
                  );
                suggestionDatabase = produtos;
              });
            }
          });
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
              onChangedFunction: searchDinamically,
            ),
            produtos.isEmpty
                ? const Center(
                    child: Text(
                      "Nenhum produto no banco de dados",
                      textScaleFactor: 1.5,
                    ),
                  )
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: suggestionDatabase.length,
                    itemBuilder: (context, index) {
                      final ProductModel produto = suggestionDatabase[index];
                      return ProductComponent(
                          produto: produto,
                          isEditable: true,
                          onClickEdit: () => editProduct(context, produto),
                          onClickRemove: () {
                            eventsBox.removeProductById(produto.id);
                            setState(() {
                              suggestionDatabase.removeAt(index);
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
