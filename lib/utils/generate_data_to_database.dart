import 'package:genilson_app/database/ObjectBox.dart';
import 'package:genilson_app/database/eventsBox.dart';
import 'package:genilson_app/models/ProductModel/ProductModel.dart';

void generateDataToDatabase(ObjectBox objectBox) {
  final EventsBox eventsBox = EventsBox(boxDatabase: objectBox);
  List<String> snackList = [
    "BOKUS SAL 45G",
    "BOKUS DOCE 45G",
  ];
  final List<ProductModel> defaultProducts = snackList.map((name) {
    return ProductModel(name: name, price: 0, quantity: 0);
  }).toList();
  eventsBox
      .addManyProductsToDatabase(defaultProducts)
      .then((value) => print("Produtos adicionados com sucesso!"));
}
