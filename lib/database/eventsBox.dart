// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:genilson_app/database/ObjectBox.dart';
import 'package:genilson_app/models/ClientModel/ClientModel.dart';

import '../models/ProductModel/ProductModel.dart';
import '../objectbox.g.dart';

class EventsBox {
  ObjectBox boxDatabase;

  EventsBox({
    required this.boxDatabase,
  });

  Future<void> addClientToObjectBox(ClientModel cliente) async {
    final store = boxDatabase.store;
    final clientBox = store.box<ClientModel>();
    await clientBox.putAsync(cliente);
  }

  Future<void> updateClient(ClientModel client) async {
    final store = boxDatabase.store;
    final clientBox = store.box<ClientModel>();
    await clientBox.putAsync(client, mode: PutMode.update);
  }

  void removeAllClients() {
    final store = boxDatabase.store;
    final clientBox = store.box<ClientModel>();
    clientBox.removeAll();
  }

  void removeClientById(int clientID) {
    final store = boxDatabase.store;
    final clientBox = store.box<ClientModel>();
    clientBox.remove(clientID);
  }

  ClientModel? getClientById(int clientId) {
    final store = boxDatabase.store;
    final clientBox = store.box<ClientModel>();
    return clientBox.get(clientId);
  }

  List<ClientModel> listarClientes() {
    final store = boxDatabase.store;

    final clientBox = store.box<ClientModel>();
    final getAllUsers = clientBox.getAll();
    return getAllUsers;
  }

  Future<void> addProductToDatabase(ProductModel produto) async {
    final store = boxDatabase.store;
    final productsBox = store.box<ProductModel>();
    await productsBox.putAsync(produto);
  }

  Future<void> addManyProductsToDatabase(List<ProductModel> produtos) async {
    final store = boxDatabase.store;
    final productsBox = store.box<ProductModel>();
    productsBox.putMany(produtos);
  }

  Future<void> updateProduct(ProductModel produto) async {
    final store = boxDatabase.store;
    final productsBox = store.box<ProductModel>();
    await productsBox.putAsync(produto, mode: PutMode.update);
  }

  Future<void> updateManyProducts(List<ProductModel> produtos) async {
    final store = boxDatabase.store;
    final productBox = store.box<ProductModel>();
    productBox.putMany(produtos, mode: PutMode.put);
  }

  void removeProductById(int id) {
    final store = boxDatabase.store;
    final productsBox = store.box<ProductModel>();
    productsBox.remove(id);
  }

  void removeAllProducts() {
    final store = boxDatabase.store;
    final productsBox = store.box<ProductModel>();
    productsBox.removeAll();
  }

  List<ProductModel> getAllProducts() {
    final store = boxDatabase.store;
    final productsBox = store.box<ProductModel>();
    return productsBox.getAll();
  }
}
