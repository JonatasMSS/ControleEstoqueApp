// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:genilson_app/database/ObjectBox.dart';
import 'package:genilson_app/models/ClientModel/ClientModel.dart';

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
}
